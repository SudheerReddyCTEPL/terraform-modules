variable "tags" {
  type = map
  default = {}
  }
  
variable "eks-cluster-role-name"{
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