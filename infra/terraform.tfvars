tags = {
  Name        = "eks-vpc-10"
  Environment = "DEV"
  terraform   = true
}
vpc_cidr              = "10.0.0.0/16"
azs                   = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidr    = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_names   = ["project-public-1a", "project-public-1b"]
private_subnet_cidr   = ["10.0.11.0/24", "10.0.12.0/24"]
private_subnet_names  = ["project-private-1a", "project-private-1b"]
public_sg_name        = "public-sg"
public_sg_description = " this security group is for public communication"
ingress_cidr = [
  {
    from_port   = "80"
    to_port     = "80"
    cidr_block  = "0.0.0.0/0"
    description = "opening 80 to internet"
    protocol    = "HTTP"
  },
  {
    from_port   = "443"
    to_port     = "443"
    cidr_block  = "0.0.0.0/0"
    description = "opening 443 to internet"
    protocol    = "HTTPS"
  },

  {
    from_port   = "22"
    to_port     = "22"
    cidr_block  = "0.0.0.0/0"
    description = "opening SSH 22 port for SSH access"
    protocol    = "TCP"

  },

]
workernode_sg_name        = "project-eks-workernode-sg"
workernode_sg_description = "This sg is for workernodes communication"
workernode_ingress_cidr = [
  {
    from_port   = "1024"
    to_port     = "65535"
    cidr_block  = "0.0.0.0/0"
    description = "opening to internet"
    protocol    = "TCP"
  },
  {
    from_port   = "443"
    to_port     = "443"
    cidr_block  = "0.0.0.0/0"
    description = "opening 443 to internet"
    protocol    = "HTTPS"
  },
]
control_plane_sg_name        = "eks-masternode-sg"
control_plane_sg_description = "This sg is for having master node communication"
control_plane_ingress_cidr = [
  {
    from_port   = "1024"
    to_port     = "65535"
    cidr_block  = "0.0.0.0/0"
    description = "opening  to internet"
    protocol    = "TCP"
  },
  {
    from_port   = "443"
    to_port     = "443"
    cidr_block  = "0.0.0.0/0"
    description = "opening 443 to internet"
    protocol    = "HTTPS"
  },
]
eks-cluster-role-name        = "project-eks-cluster"
fargate-iam-role-name        = "project-fargate-iam"
eks-workernode-iam-role-name = "eks-workernode-iam"
vpc-flowlog-role             = "project-vpc-flowlog"
vpc-iam-role-policy          = "project-vpc-iam"
log-retention                = 7
project                      = "Tuebora"
vpc-cloudwatch-group         = "project-vpc-cloudwatch"
eks-cluster-name             = "project-eks-cluster"
eks-iam-role-name            = "project-eks-iam"
vpc-cni-version              = "v1.12.6-eksbuild.2"
coredns-version              = "v1.10.1-eksbuild.1"
kube-proxy-version           = "v1.27.1-eksbuild.1"
resolve_conflicts            = "PRESERVE"
fargate-profile-name         = "project-fargate-profile"
namespace                    = "dev"
node-group                   = "project-eks-nodegroup"
desired-size                 = 2
max-size                     = 5
min-size                     = 1
max-unavailable              = 1
ami-type                     = "AL2_x86_64"
capacity-type                = "ON_DEMAND"
disk-size                    = 20
instance-types               = ["t2.medium"]
aws_access_key               = "AKIA53VAMATPXDQQMJ4W"
aws_secret_key               = "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"
region                       = "ap-south-1"
vpc-name                     = "eks-vpc-10"