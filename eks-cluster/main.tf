
module "vpc" {
  source = "../terraform-modules-vpc"


}
module "iam" {
  source = "../terraform-modules-eks-iam-role"

}
module "cloudwatch" {
  source = "../cloudwatch"
}

resource "aws_eks_cluster" "eks-cluster" {
  name = var.eks-cluster-name
  role_arn = module.iam.cluster-role-arn
  version = "1.27"
  enabled_cluster_log_types = [    # AWS EKS control plane logging
      "api",
      "audit",
    #   "controllerManager",
    #   "scheduler",
    #   "authenticator"
  ]
  

  vpc_config {
    subnet_ids = [module.vpc.subnet-ids]   
    endpoint_private_access = true
    endpoint_public_access = true
    public_access_cidrs = ["0.0.0.0/0"]
  }
  depends_on = [module.iam,module.cloudwatch] #[module.eks-iam-role.policy-dependency,module.cloudwatch-group-name.cloudwatch-log-group]

  tags = merge(var.tags, {"Name" = var.eks-cluster-name})
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name = var.eks-addon-vpc-cni
  addon_version = var.vpc-cni-version  # "v1.12.6-eksbuild.2"
  resolve_conflicts_on_update = var.resolve_conflicts

  tags = merge(var.tags, {"Name"= var.eks-addon-vpc-cni})
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name = var.eks-addon-coredns
  addon_version = var.coredns-version  # "v1.10.1-eksbuild.1"
  resolve_conflicts_on_update = var.resolve_conflicts
  tags = merge(var.tags, 
                {"Name" = var.eks-addon-coredns})
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.eks-cluster.name
  addon_name = var.eks-addon-kube-proxy
  addon_version = var.kube-proxy-version  # "v1.27.1-eksbuild.1"
  resolve_conflicts_on_update = var.resolve_conflicts
  
  tags = merge(var.tags, 
                {"Name" = var.eks-addon-kube-proxy})

}

