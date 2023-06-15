variable "log-retention" {
  type = number
}
variable "project" {
  type = string
}
variable "tags" {
  type = map
  default = {}
}
variable "vpc-cloudwatch-group" {
  type = string
}
variable "eks-cluster-name" {
  type = string
}