# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_vpc" "main" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_ipam_pool_id                    = null
  #ipv6_netmask_length                  = 0
  region = "ap-south-1"
  tags = {
    Name = "project2-monolith-vpc"
  }
  tags_all = {
    Name    = "project2-monolith-vpc"
    project = "project2-monolith"
  }
}
