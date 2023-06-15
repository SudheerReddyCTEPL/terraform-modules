locals {
   eks-cluster-arn = data.aws_iam_policy.eks-cluster-policy.arn
   fargateprofile-arn = data.aws_iam_policy.fargate-iam-policy.arn
   eks-workerNodePolicy-arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
   eks-CNI_Policy-arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
   EC2ContainerRegistryReadOnly-arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
 }