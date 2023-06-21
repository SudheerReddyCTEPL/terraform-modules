resource "aws_lb" "app_alb" {
  name = var.alb_name
  internal = var.internal
  load_balancer_type = var.lb_type[0]
  security_groups = data.aws_security_groups.public-sg-id.ids
  subnets = data.aws_subnets.public[*].ids
  #enable_deletion_protection = true
  #vpc_id = aws_vpc.main.id

   access_logs {
     bucket = "my-alb-logs-bucket"  # Replace with your desired S3 bucket name for access logs
     enabled = true
   }
  

  tags = merge(var.tags, {"Name" = var.alb_name })
}

resource "aws_lb_target_group" "targetgroup-alb" {
  count = length(var.target-group-names)
  name = var.target-group-names[count.index]
  port = var.alb-listener-ports[count.index]
  protocal = var.targetgroup-protocol
  vpc_id = data.aws_vpc.existing_vpc_id.id
  target_type = var.target-type  #instance
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  count = length(var.alb-listener-ports)   
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.targetgroup-alb.arn   
  }
}

resource "aws_lb_listener_rule" "alb-listener-rule" {
  listener_arn = aws_lb_listener.alb-listener.arn
  priority = 100

  action {
    type = "farward"
    target_group_arn = aws_lb_target_group.targetgroup-alb.arn
  }

  condition {
    path_pattern {
      values = var.pathpattern
    }
  }

  condition {
    host_header {
      values = var.hostheader
    }
  }
}

# resource "aws_lb_target_group_attachment" "alb-targetgroup-attachment" {
#   target_group_arn = aws_lb_target_group.targetgroup-alb.arn
#   target_id = aws
#   port = 80
# }

# NLB Creation

resource "aws_lb" "app-nlb" {
  name = var.nlb-name
  internal = var.internal
  load_balancer_type = var.lb_type[1]
  subnets = data.aws_subnets.public[*].ids

  #enable_deletion_protection = true
}

resource "aws_api_gateway_vpc_link" "this" {
    name = var.vpc-link-name
    target_arns = [aws_lb.app-nlb.arn]
    
    tags = merge(var.tags, {"Name" = var.vpc-link-name})

}

resource "aws_lb_target_group" "targetgroup-nlb" {
  count = length(var.nlb-target-group-names)
  name = var.nlb-target-group-names[count.index]
  port = var.nlb-listener-ports[count.index]
  protocal = var.nlb-targetgroup-protocol
  vpc_id = data.aws_vpc.existing_vpc_id.id
  target_type = var.target-type  #instance
}



resource "aws_alb_listener" "nlb-listener" {
    load_balancer_arn = aws_lb.app-nlb.arn
    count = length(var.nlb-listener-ports)
    port = var.nlb-listener-ports[count.index]
    protocol = "TCP" # TLS
    #vpc_link_id = aws_api_gateway_vpc_link.nlb_vpc_link.id
    
     
    default_action {
       type             = "forward"
       target_group_arn = aws_lb_target_group.targetgroup-nlb.arn
  }
}

resource "aws_lb_listener_rule" "nlb-listener-rule" {
  listener_arn = aws_alb_listener.nlb-listener.arn
  priority = 100

  action {
    type = "farward"
    target_group_arn = aws_lb_target_group.targetgroup-nlb.arn
  }

  condition {
    path_pattern {
      values = var.pathpattern
    }
  }

  condition {
    host_header {
      values = var.hostheader
    }
  }
}