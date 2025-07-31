variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}
variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}
variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
}
variable "project_name" {
  type        = string
  description = "Prefix for naming resources"
}