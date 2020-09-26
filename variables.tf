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


variable "node_subnets" {
  type = list(string)

}

variable "instance_types" {
  type    = list(string)
  default = ["t3.large"]

}

variable "ami_type" {
  type        = string
  default     = "AL2_x86_64"
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU. "
}

variable "disk_size" {
  type        = number
  default     = 60
  description = "Disk size in GiB for worker nodes."

}

variable "node_tags" {
  description = "A map of tags"
  type        = map(string)
  default     = {}
}

variable "remote_access" {
  type        = any
  default     = []
  description = "Map for remote_acess configuration"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID for security group"
}

variable "ec2_ssh_key" {
  type        = string
  description = "(optional) describe your variable"
  default     = ""
}

variable "create_cluster_iam" {
  type        = bool
  default     = true
  description = "Controls iam rules are created to EKS master will be created or not"
}


variable "scaling_config" {
  type        = list(map(any))
  default     = []
  description = "Variable used to define scaling configuration"
}

variable "create_node_iam" {
  type        = bool
  default     = true
  description = "Controls if an IAM policy will be created. If false, a policy ARN hould be provided"
}

variable "role_arn" {
  type        = string
  default     = ""
  description = "Role ARN to be used by EKS Nodes"
}

variable "create_cluster_autoscaler" {
  type        = bool
  default     = false
  description = "Controls if a policy for cluster autoscaler will be created"
}
