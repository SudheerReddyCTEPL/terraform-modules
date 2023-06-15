variable "tags" {
  type = map
  default = {
    # Name = "Tuebora"
    # Environment = "DEV"
    # terraform = true
  }

}

variable "vpc_cidr" {
  type = string
}
variable "azs"{
  type = list(string)
  # default = ["ap-south-1a","ap-south-1b"]
}
variable "public_subnet_cidr" {
  type = list(string)
  # default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_subnet_names" {
  type = list(string)
  # default = ["project-public-1a","project-public-1b"] # we can define in dynamic way

  /* default = [format("%s-%s-%s",lookup(var.tags,"Name"),"public","1a"),
  format("%s-%s-%s",lookup(var.tags,"Name"),"public","1b")] */
}
variable "private_subnet_cidr" {
  type = list(string)
  # default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "private_subnet_names" {
  type = list(string)
  # default = [format("%s-%s-%s",lookup(var.tags,"Name"),"private","1a"),
  # format("%s-%s-%s",lookup(var.tags,"Name"),"private","1b")]

}

variable "public_sg_name" {
  type = string
}
variable "public_sg_description" {
  type = string
}
variable "ingress_cidr" {
  type = list(string)
  # default = []  # must provide on basis of requirement
}
variable "workernode_sg_name" {
  type = string
}
variable "workernode_sg_description" {
  type = string
}
variable "workernode_ingress_cidr" {
  type = list(map(string))
}
variable "control_plane_sg_name" {
  type = string
}
variable "control_plane_sg_description" {
  type = string
}
variable "control_plane_ingress_cidr" {
  type = list(map(string))
}
variable "eks-cluster-role-name" {
  type = string
}
variable "fargate-iam-role-name" {
  type = string
}
variable "eks-workernode-iam-role-name" {
  type = string
}
variable "vpc-flowlog-role" {
  type = string
}
variable "vpc-iam-role-policy" {
  type = string
}
variable "log-retention" {
  type = number
}
variable "project" {
  type = string
}
variable "vpc-cloudwatch-group" {
  type = string
}
variable "eks-cluster-name" {
  type = string
}
variable "eks-iam-role-name" {
  type = string
}
variable "vpc-cni-version" {
  type = string
}
variable "coredns-version" {
  type = string
}
variable "kube-proxy-version" {
  type = string
}
variable "resolve_conflicts" {
  type = string
}
variable "fargate-profile-name" {
  type = string
}
variable "namespace" {
  type = string
}
variable "node-group" {
  type = string
}
variable "desired-size" {
  type = number
}
variable "max-size" {
  type = number
}
variable "min-size" {
  type = number
}
variable "max-unavailable" {
  type = number
}
variable "ami-type" {
  type = string
}
variable "capacity-type" {
  type = string
}
variable "disk-size" {
  type = number
}
variable "instance-types" {
  type = list(string)
}
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "region" {
  type = string
}
# variable "database_subnet_cidr" {
#   type = list(string)
#   #default = ["10.0.21.0/24","10.0.22.0/24"]
# }
# variable "database_subnet_names" {
#   type = list(string)
#    # default = [format("%s-%s-%s",lookup(var.tags,"Name"),"database","1a"),
#   # format("%s-%s-%s",lookup(var.tags,"Name"),"database","1b")]
# }
# variable "rds_security_group_name" {
#   type = string
#   # default = "<project>"
# }
# variable "rds_security_group_description" {
#   type = string
#   # default = "This security group is to attach <project> RDS"
#}

# variable "allocated_storage" {
#   type = number
#   # default = "10"
# }

# variable "db_name" {

#   default = "<project-db>"
# }
# variable "identifier" {
#   default = "<project-db>"
# }
# variable "engine" {
#   default = "postgres"
# }
# variable "engine_version" {
#   default = "14.7-R1"
# }
# variable "instance_type" {
#   default = "<db-type>"
# }
# variable "rds_username" {
#   default = "<any-username>"
# }
# variable "secret_name" {
#   default = "<project-db/rds_password>"
# }
# variable "rds_secret_arn" {
#   default = "<secret manager arn value>"
# }
# variable "ecs_cluster_name" {
#   default = "<project>"
# }
# variable "ecs_log_group_name" {
#   default = "/<project>/ecs-cluster"
# }
# variable "app_alb_security_group_name " {
#   default = "<project>_alb"
# }
# variable "app_alb_security_group_description" {
#   default = "This is used for application alb"
# }
# variable "app_alb_ingress_cidr" {
#   default = [
#     {
#       from_port = "80"
#       to_port =  "80"
#       cidr_block = "0.0.0.0/0"
#       description = "opening 80 to internet"
#     },
#     { 
#       from_port = "443"
#       to_port =  "443"
#       cidr_block = "0.0.0.0/0"
#       description = "opening 443 to internet"
#     }

#   ]
# }
variable "s3_bucket_name" {
  type = string
}

