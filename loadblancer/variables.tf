variable "alb_name" {
  type = string
}
variable "internal" {
  type = bool
}
variable "lb_type" {
  type = list(string)
}
variable "target-group-names" {
  type = list(string)
}
variable "alb-listener-ports" {
  type = list(string)
}
variable "targetgroup-protocol" {
  type = string
}
variable "target-type" {
  type = string
}
variable "pathpattern" {
  type = list(string)
}
variable "hostheader" {
  type = list(string)
}
variable "tags" {
  type = map
  default = {}
}
variable "nlb-name" {
  type = string
}