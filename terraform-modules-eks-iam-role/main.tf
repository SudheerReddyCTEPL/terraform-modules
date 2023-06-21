# EKS Cluster IAM Role
resource "aws_iam_role" "eks-cluster-role" {
  name = var.eks-cluster-role-name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  
  
#   /*jsonencode(
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# })*/
   tags = merge(var.tags,{"Name" = var.eks-cluster-role-name})
}

  data "aws_iam_policy" "eks-cluster-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
 }

 resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
   policy_arn = local.eks-cluster-arn
   role       = aws_iam_role.eks-cluster-role.name
 }

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# FargateProfile IAM Role

resource "aws_iam_role" "fargate-iam-role" {
  name = var.fargate-iam-role-name
  assume_role_policy = data.aws_iam_policy_document.fargate-assume-role.json

  tags = merge(var.tags,{"Name" = var.fargate-iam-role-name})
}

data "aws_iam_policy" "fargate-iam-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "fargateprofile-policy" {
  policy_arn = local.fargateprofile-arn
  role = aws_iam_role.fargate-iam-role.name
  
}
data "aws_iam_policy_document" "fargate-assume-role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["eks-fargate-pods.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# EKS Node IAM Role

resource "aws_iam_role" "workernode" {
  name = var.eks-workernode-iam-role-name
  assume_role_policy = data.aws_iam_policy_document.workernode-assume_role.json

  tags = merge(var.tags,{"Name" = var.eks-workernode-iam-role-name})
}

resource "aws_iam_role_policy_attachment" "node_AmazonEKSWorkerNodePolicy" {
  policy_arn = local.eks-workerNodePolicy-arn
  role = aws_iam_role.workernode.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonEKS_CNI_Policy" {
  policy_arn = local.eks-CNI_Policy-arn
  role = aws_iam_role.workernode.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = local.EC2ContainerRegistryReadOnly-arn
  role = aws_iam_role.workernode.name
}

data "aws_iam_policy_document" "workernode-assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# VPC Flow logs IAM Role

data "aws_iam_policy_document" "vpc-flowlog_assume-role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vpcflowlog-role" {
  name = var.vpc-flowlog-role
  assume_role_policy = data.aws_iam_policy_document.vpc-flowlog_assume-role.json
}

data "aws_iam_policy_document" "logs-policy-role" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "vpc-logs-policy" {
  name = var.vpc-iam-role-policy
  role = aws_iam_role.vpcflowlog-role.id
  policy = data.aws_iam_policy_document.logs-policy-role.json
}

# CloudTrail IAM ROle

data "aws_iam_policy_document" "cloudtrail-policy-document" {
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}