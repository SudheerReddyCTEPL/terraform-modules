# output "eks-cluster-policy-details" {
#    value = data.aws_iam_policy.eks-cluster-policy.arn
#  }

output "data" {
  value = data.aws_iam_policy_document.assume_role.json
}
output "policy-dependency" {
  value = aws_iam_role_policy_attachment.eks_cluster_policy
}
output "cluster-role-arn" {
  value = aws_iam_role.eks-cluster-role.arn
}
output "fargate-policy-dependency" {
  value = aws_iam_group_policy_attachment.fargateprofile-policy
}
output "fargateprofile-role-arn" {
  value = aws_iam_role.fargate-iam-role.arn
}
output "workernode-iam-role" {
  value = aws_iam_role.workernode.arn
}
output "workernode-dependency" {
  value = aws_iam_group_policy_attachment.node_AmazonEKSWorkerNodePolicy
}
output "eks-cni-dependency" {
  value = aws_iam_group_policy_attachment.node_AmazonEKS_CNI_Policy
}
output "ec2containerregistryreadonly-dependency" {
  value = aws_iam_group_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly
}
output "vpcflowlog-iam-role-arn" {
  value = aws_iam_role.vpcflowlog-role.arn
}