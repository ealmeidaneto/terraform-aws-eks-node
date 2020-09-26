# EKS Node Variables
variable "cluster_name" {
  type        = string
  default     = ""
  description = "(Required) Name of the EKS Cluster."
}

variable "node_group_name" {
  type        = string
  default     = "node-group-01"
  description = " (Required) Name of the EKS Node Group."
}

variable "create_node_iam" {
  type        = bool
  default     = true
  description = "Controls if an IAM policy will be created. If false, variable node_role_arn should receive a policy ARN"
}

variable "node_role_arn" {
  type        = string
  default     = ""
  description = "(Required) Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group."
}

variable "scaling_config" {
  type        = list(map(any))
  default     = []
  description = "(Required) Configuration block with scaling settings."
}

variable "subnet_ids" {
  type = list(string)
  description = "(Required) Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."

}

variable "ami_type" {
  type        = string
  default     = "AL2_x86_64"
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU. "
}

variable "disk_size" {
  type        = number
  default     = 20
  description = "Disk size in GiB for worker nodes. Defaults to 20"

}
variable "force_update_version" {
  type = bool
  default = false
  description =  "(Optional) Force version update if existing pods are unable to be drained due to a pod disruption budget issue."
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
  description = "(Optional) Set of instance types associated with the EKS Node Group. Defaults to [. Terraform will only perform drift detection if a configuration value is provided. Currently, the EKS API only accepts a single value in the set."
}

variable "labels" {
  type = map(string)
  default = {}
  description = "(Optional) Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed."
}

variable "launch_template" {
  type = list(map(string))
  default = []
  description = "(Optional) Configuration block with Launch Template settings. Detailed below."
}

// variable "release_version" {
//   type = string
//   default = "latest"
//   description = "(Optional) AMI version of the EKS Node Group. Defaults to latest version for Kubernetes version."
// }


variable "remote_access" {
  type        = any
  default     = []
  description = "(Optional) Configuration block with remote access settings."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) Key-value map of resource tags."
}

variable "ec2_ssh_key" {
  type        = string
  description = "(optional) describe your variable"
  default     = ""
}

variable "kubernetes_version" {
  type = string
  default = "1.17"
  description = "(Optional) Kubernetes version. Defaults to EKS Cluster Kubernetes version. Terraform will only perform drift detection if a configuration value is provided."
}

variable "create_cluster_autoscaler" {
  type        = bool
  default     = false
  description = "Controls if a policy for cluster autoscaler will be created"
}
