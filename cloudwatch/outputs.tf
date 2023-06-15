output "cloudwatch-log-group-name" {
  value = aws_cloudwatch_log_group.eks_control_plane_logs.name
}
output "cloudwatch-group-name" {
  value = aws_cloudwatch_log_group.eks_control_plane_logs.arn
}
output "cloudwatch-log-group" {
  value = aws_cloudwatch_log_group.eks_control_plane_logs
}
output "vpc-cloudwatch-group-arn" {
  value = aws_cloudwatch_log_group.vpc-log-group.arn
}