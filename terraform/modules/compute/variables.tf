variable "name" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "ingress_rules" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    source    = optional(string)
    source_sg = optional(string)
  }))
  default = []
}
variable "egress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = string
  }))
  default = []
}