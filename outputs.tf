output arn {
  value       = aws_eks_node_group.eks-managed-nodes.arn
  description = "Amazon Resource Name (ARN) of the EKS Node Group."
}

output id {
  value       = aws_eks_node_group.eks-managed-nodes.id
  description = ""
} 


output status {
  value       = aws_eks_node_group.eks-managed-nodes.status 
  description = "Status of the EKS Node Group."
} 
