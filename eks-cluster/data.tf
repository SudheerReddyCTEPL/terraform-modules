data "aws_iam_role" "eks-cluster-role" {
  name = var.eks-cluster-role-name
}

data "aws_vpc" "existing_vpc_id" {
   tags = {
    Name = var.vpc-name
   }
}
data "aws_iam_role" "fargateprofile-arn" {
  name = var.fargate-iam-role-name
}
data "aws_iam_role" "worknode-role-arn" {
  name = var.eks-workernode-iam-role-name
}
data "aws_subnets" "subnet-ids" {
     filter {
       name = "vpc-id"
       values = [local.vpc_id]
     }
}
data "aws_subnets" "private-subnets" {
   filter {
     name = "vpc-id"
     values = [local.vpc_id]
   }
   filter{
    name = "tag:Name"
    values = var.private_subnet_names
   }

}

data "aws_security_groups" "eks-workernode-sg" {
  filter {
    name = "group-name"
    values = [var.workernode_sg_name]
  }
}