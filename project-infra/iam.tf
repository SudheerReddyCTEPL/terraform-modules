module "iam" {
  source = "../terraform-modules-eks-iam-role"
  eks-cluster-role-name = var.eks-cluster-role-name
  fargate-iam-role-name = var.fargate-iam-role-name
  eks-workernode-iam-role-name = var.eks-workernode-iam-role-name
  vpc-flowlog-role = var.vpc-flowlog-role
  vpc-iam-role-policy = var.vpc-iam-role-policy
  tags = var.tags
}