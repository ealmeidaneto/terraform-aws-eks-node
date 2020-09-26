# Terraform EKS Node Group Module
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.0.0 |
| random | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_type | Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2\_x86\_64. Valid values: AL2\_x86\_64, AL2\_x86\_64\_GPU. | `string` | `"AL2_x86_64"` | no |
| cluster\_name | (Required) Name of the EKS Cluster. | `string` | `""` | no |
| create\_cluster\_autoscaler | Controls if a policy for cluster autoscaler will be created | `bool` | `false` | no |
| create\_node\_iam | Controls if an IAM policy will be created. If false, variable node\_role\_arn should receive a policy ARN | `bool` | `true` | no |
| disk\_size | Disk size in GiB for worker nodes. Defaults to 20 | `number` | `20` | no |
| ec2\_ssh\_key | (optional) describe your variable | `string` | `""` | no |
| force\_update\_version | (Optional) Force version update if existing pods are unable to be drained due to a pod disruption budget issue. | `bool` | `false` | no |
| instance\_types | (Optional) Set of instance types associated with the EKS Node Group. Defaults to [. Terraform will only perform drift detection if a configuration value is provided. Currently, the EKS API only accepts a single value in the set. | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| kubernetes\_version | (Optional) Kubernetes version. Defaults to EKS Cluster Kubernetes version. Terraform will only perform drift detection if a configuration value is provided. | `string` | `"1.17"` | no |
| labels | (Optional) Key-value map of Kubernetes labels. Only labels that are applied with the EKS API are managed by this argument. Other Kubernetes labels applied to the EKS Node Group will not be managed. | `map(string)` | `{}` | no |
| launch\_template | (Optional) Configuration block with Launch Template settings. Detailed below. | `list(map(string))` | `[]` | no |
| node\_group\_name | (Required) Name of the EKS Node Group. | `string` | `"node-group-01"` | no |
| node\_role\_arn | (Required) Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group. | `string` | `""` | no |
| remote\_access | (Optional) Configuration block with remote access settings. | `any` | `[]` | no |
| scaling\_config | (Required) Configuration block with scaling settings. | `list(map(any))` | `[]` | no |
| subnet\_ids | (Required) Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER\_NAME (where CLUSTER\_NAME is replaced with the name of the EKS Cluster). | `list(string)` | n/a | yes |
| tags | (Optional) Key-value map of resource tags. | `map(string)` | `{}` | no |

## Outputs

No output.
