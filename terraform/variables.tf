variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "natgw1" {
  description = "NAT gateway ID 1"
  type        = string
}

variable "natgw2" {
  description = "NAT gateway ID 2"
  type        = string
}

variable "igw" {
  description = "Internet gateway ID"
  type        = string
}