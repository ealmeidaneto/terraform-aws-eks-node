resource "aws_eks_node_group" "eks-managed-nodes" {

  cluster_name         = var.cluster_name
  node_group_name      = var.node_group_name
  node_role_arn        = var.create_node_iam ? aws_iam_role.eks-node-group[0].arn : var.node_role_arn
  subnet_ids           = var.subnet_ids
  ami_type             = var.ami_type
  disk_size            = var.disk_size
  force_update_version = var.force_update_version
  instance_types       = var.instance_types
  // release_version = var.release_version
  version = var.kubernetes_version


  dynamic "launch_template" {
    for_each = var.launch_template
    content {
      id      = lookup(var.launch_template, "id", null)
      name    = lookup(var.launch_template, "name", null)
      version = lookup(var.launch_template, "version", null)

    }
  }


  dynamic "scaling_config" {
    for_each = var.scaling_config

    content {

      desired_size = scaling_config.value.desired_size
      max_size     = scaling_config.value.max_size
      min_size     = scaling_config.value.min_size

    }
  }

  dynamic "remote_access" {

    for_each = var.remote_access

    content {
      ec2_ssh_key = lookup(remote_access.value, "ec2_ssh_key")
      # TODO: Fix string problem
      source_security_group_ids = lookup(remote_access.value, "source_security_group_ids", null)

    }
  }

  labels = var.labels

  tags = var.tags

  depends_on = [

    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]

}

