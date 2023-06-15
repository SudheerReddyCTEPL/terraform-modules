output "vpc_id" {
  value = module.vpc.vpc_id
}
output "aws_subnet_ids" {
  value = module.vpc.aws_subnet_ids
}
output "public_sg_id" {
  value = module.sg.public_sg_id
}
output "workernode_sg_id" {
  value = module.sg.workernode_sg_id
}
output "control_plane_sg_id" {
  value = module.sg.control_plane_sg_id
}
output "s3_bucket_name" {
  value = module.s3.bucket-name
}
output "eks-cluster-role-name" {
  value = module.eks-cluster.eks-cluster-role-name
}
output "endpoint" {
  value = module.eks-cluster.endpoint
}

output "eks-cluster-name" {
  value = module.eks-cluster.eks-cluster-name
}
output "fargate-arn" {
  value = module.eks-cluster.fargate-arn
}
output "fargate-id" {
  value = module.eks-cluster.fargate-id
}
output "fargate-status" {
  value = module.eks-cluster.fargate-status
}
output "cluster-iam-role-arn" {
  value = module.iam.cluster-role-arn
}
output "eks-nodegroup-arn" {
  value = module.eks-cluster.eks-nodegroup-arn
}
output "nodegroup-id" {
  value = module.eks-cluster.nodegroup-id
}
output "eks-nodegroup-status" {
  value = module.eks-cluster.eks-nodegroup-status
}
output "cloudwatch-log-group-name" {
  value = module.cloudwatch.cloudwatch-log-group-name
}
output "vpc-cloudwatch-group-arn" {
  value = module.cloudwatch.vpc-cloudwatch-group-arn
}