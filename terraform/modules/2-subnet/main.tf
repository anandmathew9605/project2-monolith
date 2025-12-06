# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "public_az1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-south-1a"
  #availability_zone_id                           = "aps1-az1"
  cidr_block               = "10.0.1.0/24"
  customer_owned_ipv4_pool = null
  enable_dns64             = false
  #enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  #map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch             = true
  outpost_arn                         = null
  private_dns_hostname_type_on_launch = "ip-name"
  region                              = "ap-south-1"
  tags = {
    Name = "project2-monolith-public-subnet-1"
  }
  tags_all = {
    Name    = "project2-monolith-public-subnet-1"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "public_az2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-south-1b"
  #availability_zone_id                           = "aps1-az3"
  cidr_block               = "10.0.2.0/24"
  customer_owned_ipv4_pool = null
  enable_dns64             = false
  #enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  #map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch             = true
  outpost_arn                         = null
  private_dns_hostname_type_on_launch = "ip-name"
  region                              = "ap-south-1"
  tags = {
    Name = "project2-monolith-public-subnet-2"
  }
  tags_all = {
    Name    = "project2-monolith-public-subnet-2"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "private_app_az1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-south-1a"
  #availability_zone_id                           = "aps1-az1"
  cidr_block               = "10.0.11.0/24"
  customer_owned_ipv4_pool = null
  enable_dns64             = false
  #enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  #map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch             = false
  outpost_arn                         = null
  private_dns_hostname_type_on_launch = "ip-name"
  region                              = "ap-south-1"
  tags = {
    Name = "project2-monolith-app-subnet-1"
  }
  tags_all = {
    Name    = "project2-monolith-app-subnet-1"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "private_app_az2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-south-1b"
  #availability_zone_id                           = "aps1-az3"
  cidr_block               = "10.0.12.0/24"
  customer_owned_ipv4_pool = null
  enable_dns64             = false
  #enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  #map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch             = false
  outpost_arn                         = null
  private_dns_hostname_type_on_launch = "ip-name"
  region                              = "ap-south-1"
  tags = {
    Name = "project2-monolith-app-subnet-2"
  }
  tags_all = {
    Name    = "project2-monolith-app-subnet-2"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "private_db_az1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-south-1a"
  #availability_zone_id                           = "aps1-az1"
  cidr_block               = "10.0.21.0/24"
  customer_owned_ipv4_pool = null
  enable_dns64             = false
  #enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  #map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch             = false
  outpost_arn                         = null
  private_dns_hostname_type_on_launch = "ip-name"
  region                              = "ap-south-1"
  tags = {
    Name = "project2-monolith-db-subnet-1"
  }
  tags_all = {
    Name    = "project2-monolith-db-subnet-1"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "private_db_az2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = "ap-south-1b"
  #availability_zone_id                           = "aps1-az3"
  cidr_block               = "10.0.22.0/24"
  customer_owned_ipv4_pool = null
  enable_dns64             = false
  #enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  #map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch             = false
  outpost_arn                         = null
  private_dns_hostname_type_on_launch = "ip-name"
  region                              = "ap-south-1"
  tags = {
    Name = "project2-monolith-db-subnet-2"
  }
  tags_all = {
    Name    = "project2-monolith-db-subnet-2"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
