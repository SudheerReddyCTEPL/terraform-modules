output "vpc_id" {
  value = data.aws_vpc.existing_vpc_id.id
}
output "subnet_ids" {
  value = data.aws_subnets.subnets.ids
}
output "public-sg-id" {
  value = data.aws_security_groups.public-sg-id.id
}