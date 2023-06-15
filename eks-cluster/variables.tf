variable "eks-cluster-name" {
  type = string
}
variable "eks-iam-role-name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "tags" {
  type = map
}
variable "eks-addon-vpc-cni" {
  type = string
  default = "vpc-cni"
}
variable "eks-addon-coredns" {
  type = string
  default = "coredns"
}
variable "eks-addon-kube-proxy" {
  type = string
  default = "kube-proxy"
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
  default = "PRESERVE"
}
variable "project" {
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