module "eks-cluster" {
  source = "../eks-cluster"
}


resource "aws_cloudwatch_log_group" "eks_control_plane_logs" {
  name = "/aws/eks/${var.eks-cluster-name}/control-plane-logs"
  retention_in_days = var.log-retention

  tags = merge(var.tags)
}

# creates a subscription filter to forward logs from the EKS control plane to the CloudWatch Logs group
resource "aws_cloudwatch_log_subscription_filter" "name" {
  name = "${var.project}-cluster-control-plane-logs-filter"
  log_group_name = aws_cloudwatch_log_group.eks_control_plane_logs.name
  filter_pattern = ""    # filter stream of log events
  destination_arn = aws_cloudwatch_log_group.eks_control_plane_logs.arn
  
}

resource "aws_cloudwatch_log_group" "vpc-log-group" {
  name = var.vpc-cloudwatch-group

}