# Terraform EKS Node  group module
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
| create\_cluster\_iam | Controls iam rules are created to EKS master will be created or not | `bool` | `true` | no |
| create\_node\_iam | Controls if an IAM policy will be created. If false, a policy ARN hould be provided | `bool` | `true` | no |
| disk\_size | Disk size in GiB for worker nodes. | `number` | `60` | no |
| ec2\_ssh\_key | (optional) describe your variable | `string` | `""` | no |
| instance\_types | n/a | `list(string)` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| node\_group\_name | (Required) Name of the EKS Node Group. | `string` | `"node-group-01"` | no |
| node\_subnets | n/a | `list(string)` | n/a | yes |
| node\_tags | A map of tags | `map(string)` | `{}` | no |
| remote\_access | Map for remote\_acess configuration | `any` | `[]` | no |
| role\_arn | Role ARN to be used by EKS Nodes | `string` | `""` | no |
| scaling\_config | Variable used to define scaling configuration | `list(map(any))` | `[]` | no |
| vpc\_id | VPC ID for security group | `string` | `""` | no |

## Outputs

No output.
