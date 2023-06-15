output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_ids" {
  value = [aws_subnet.public[*].id]  
}
# output "subnet_group_ids" {
#   value = aws_db_subnet_group.database.id
# }

# output "alb_arn" {
#   value = aws_lb.app_alb.arn
# }
# output "target_group_arn" {
#   value = aws_lb_target_group.project_target_group_alb[*].arn
# }
# output "vpc_link_id" {
#   value = aws_api_gateway_vpc_link.nlb_vpc_link.id
# }
output "private_subnet_ids" {
  value = [aws_subnet.private[*].id]
}
output "subnet-ids" {
  value = [aws_subnet.public[*].id,aws_subnet.private[*].id]  
}