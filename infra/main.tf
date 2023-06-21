module "vpc" {
  source                  = "../terraform-modules-vpc"
  vpc_cidr                = var.vpc_cidr
  tags                    = var.tags
  public_subnet_cidr      = var.public_subnet_cidr
  azs                     = var.azs
  public_subnet_names     = var.public_subnet_names
  public_route_table_name = local.public_route_table_name

  # private subnets
  private_subnet_cidr      = var.private_subnet_cidr
  private_subnet_names     = var.private_subnet_names
  private_route_table_name = local.private_route_table_name
  vpc-flowlog-role         = var.vpc-flowlog-role
  project                  = var.project
  vpc-cloudwatch-group     = var.vpc-cloudwatch-group
  vpc-name                 = var.vpc-name
  vpc-iam-role-policy      = var.vpc-iam-role-policy

  depends_on = [module.cloudwatch, module.iam]
}

module "sg" {
  source                       = "../terraform-modules-security-group"
  public_sg_name               = var.public_sg_name
  public_sg_description        = var.public_sg_description
  ingress_cidr                 = var.ingress_cidr
  workernode_sg_name           = var.workernode_sg_name
  workernode_sg_description    = var.workernode_sg_description
  workernode_ingress_cidr      = var.workernode_ingress_cidr
  control_plane_sg_name        = var.control_plane_sg_name
  control_plane_sg_description = var.control_plane_sg_description
  control_plane_ingress_cidr   = var.control_plane_ingress_cidr
  tags                         = var.tags
  vpc_id                       = local.vpc_id
  vpc-name                     = var.vpc-name
  depends_on                   = [module.vpc]
}

module "iam" {
  source                       = "../terraform-modules-eks-iam-role"
  eks-cluster-role-name        = var.eks-cluster-role-name
  fargate-iam-role-name        = var.fargate-iam-role-name
  eks-workernode-iam-role-name = var.eks-workernode-iam-role-name
  vpc-flowlog-role             = var.vpc-flowlog-role
  vpc-iam-role-policy          = var.vpc-iam-role-policy
  tags                         = var.tags
}

module "cloudwatch" {
  source               = "../cloudwatch"
  log-retention        = var.log-retention
  project              = var.project
  tags                 = var.tags
  vpc-cloudwatch-group = var.vpc-cloudwatch-group
  eks-cluster-name     = var.eks-cluster-name
  depends_on = [ module.iam ]
}

module "eks-cluster" {
  source                       = "../eks-cluster"
  eks-cluster-name             = var.eks-cluster-name
  eks-iam-role-name            = var.eks-iam-role-name
  vpc_id                       = local.vpc_id
  tags                         = var.tags
  vpc-cni-version              = var.vpc-cni-version
  coredns-version              = var.coredns-version
  kube-proxy-version           = var.kube-proxy-version
  resolve_conflicts            = var.resolve_conflicts
  project                      = var.project
  fargate-profile-name         = var.fargate-profile-name
  namespace                    = var.namespace
  node-group                   = var.node-group
  desired-size                 = var.desired-size
  max-size                     = var.max-size
  min-size                     = var.min-size
  max-unavailable              = var.max-unavailable
  ami-type                     = var.ami-type
  capacity-type                = var.capacity-type
  disk-size                    = var.disk-size
  instance-types               = var.instance-types
  vpc-name                     = var.vpc-name
  fargate-iam-role-name        = var.fargate-iam-role-name
  eks-workernode-iam-role-name = var.eks-workernode-iam-role-name
  private_subnet_names         = var.private_subnet_names
  eks-cluster-role-name        = var.eks-cluster-role-name
  workernode_sg_name           = var.workernode_sg_name            
  depends_on                   = [module.iam]
  
}

# module "lb" {
#   source = "../loadblancer"




# }

module "s3" {
  source         = "../s3"
  s3_bucket_name = var.s3_bucket_name
  tags           = var.tags
}