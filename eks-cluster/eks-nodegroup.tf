# EKS NODE GROUP

# module "workernode-role" {
#   source = "../terraform-modules-eks-iam-role"
# }
# module "vpc" {
#   source = "../terraform-modules-vpc"
# }

resource "aws_eks_node_group" "this" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  node_group_name = var.node-group
  node_role_arn = data.aws_iam_role.worknode-role-arn.arn
  subnet_ids = data.aws_subnets.private-subnets.ids

  scaling_config {
    desired_size = var.desired-size
    max_size = var.max-size
    min_size = var.min-size
  }

  update_config {
    max_unavailable = var.max-unavailable
  }

  ami_type = var.ami-type
  capacity_type = var.capacity-type
  disk_size = var.disk-size
  instance_types = var.instance-types

  tags = merge(var.tags)

  
  
  #[module.workernode-role.workernode-dependency,module.workernode-role.eks-cni-dependency,
  #module.workernode-role.ec2containerregistryreadonly-dependency]
}