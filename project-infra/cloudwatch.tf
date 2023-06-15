module "cloudwatch" {
  source = "../cloudwatch"
  log-retention = var.log-retention
  project = var.project
  tags = var.tags
  vpc-cloudwatch-group = var.vpc-cloudwatch-group
  eks-cluster-name = var.eks-cluster-name
}
