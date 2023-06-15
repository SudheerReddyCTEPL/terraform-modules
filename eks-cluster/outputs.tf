output "eks-cluster-role-name" {
  value = data.aws_iam_role.eks-cluster-role.name
}

output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}
output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}
output "eks-cluster-name" {
  value = aws_eks_cluster.eks-cluster.name
}
output "fargate-arn" {
  value = aws_eks_fargate_profile.eks-fargate.arn
}
output "fargate-id" {
  value = aws_eks_fargate_profile.eks-fargate.id
}
output "fargate-status" {
  value = aws_eks_fargate_profile.eks-fargate.status
}
output "cluster-iam-role-arn" {
  value = aws_eks_cluster.eks-cluster.role_arn
}
output "eks-nodegroup-arn" {
  value = aws_eks_node_group.this.arn
}
output "nodegroup-id" {
  value = aws_eks_node_group.this.id
}
output "eks-nodegroup-status" {
  value = aws_eks_node_group.this.status
}