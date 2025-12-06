variable "vpc_id" {
  description = "VPC ID for route table creation"
  type        = string
}

variable "natgw1" {
  description = "NAT gateway ID 1 for route table creation" 
  type = string
}

variable "natgw2" {
  description = "NAT gateway ID 2 for route table creation" 
  type = string
}

variable "igw" {
  description = "Internet gateway ID for route table creation" 
  type = string
}
