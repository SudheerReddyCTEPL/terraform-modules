
resource "aws_eks_fargate_profile" "eks-fargate" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  fargate_profile_name = var.fargate-profile-name
  subnet_ids = module.vpc.private_subnet_ids
  pod_execution_role_arn = module.iam.fargateprofile-role-arn

  selector {
    namespace = var.namespace
  }

  tags = merge(var.tags)
}