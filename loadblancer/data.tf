data "aws_vpc" "existing_vpc_id" {
   tags = {
    Name = var.vpc-name
   }
}

data "aws_security_groups" "public-sg-id" {
  filter {
    name = "group-name"
    values = [ var.public_sg_name]
  }
}
data "aws_subnets" "public" {
  filter {
    name = "Name"
    values = [var.public_subnet_names[*]]
  }
}