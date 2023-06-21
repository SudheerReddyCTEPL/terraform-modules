
resource "aws_eks_fargate_profile" "eks-fargate" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  fargate_profile_name = var.fargate-profile-name
  subnet_ids = data.aws_subnets.private-subnets.ids
  pod_execution_role_arn = data.aws_iam_role.fargateprofile-arn.arn

  selector {
    namespace = var.namespace
  }

  tags = merge(var.tags)
}