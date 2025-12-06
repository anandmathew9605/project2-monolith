# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_nat_gateway" "nat_az1" {
  allocation_id            = "eipalloc-0e6874fc08803a3c2"
  availability_mode        = "zonal"
  connectivity_type        = "public"
  private_ip               = "10.0.1.225"
  region                   = "ap-south-1"
  secondary_allocation_ids = []
  #secondary_private_ip_address_count = 0
  #secondary_private_ip_addresses     = []
  subnet_id = "subnet-005a5ae3da9bc6770"
  tags = {
    Name = "project2-monolith-natgw-1"
  }
  tags_all = {
    Name    = "project2-monolith-natgw-1"
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_nat_gateway" "nat_az2" {
  allocation_id            = "eipalloc-07acd0f619adb1102"
  availability_mode        = "zonal"
  connectivity_type        = "public"
  private_ip               = "10.0.2.9"
  region                   = "ap-south-1"
  secondary_allocation_ids = []
  #secondary_private_ip_address_count = 0
  #secondary_private_ip_addresses     = []
  subnet_id = "subnet-058b38a9ab1f26783"
  tags = {
    Name = "project2-monolith-natgw-2"
  }
  tags_all = {
    Name    = "project2-monolith-natgw-2"
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}

/*# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "nat-1cff8ac2b6f558d7d"
resource "aws_nat_gateway" "nat" {
  allocation_id     = null
  availability_mode = "regional"
  connectivity_type = "public"
  region            = "ap-south-1"
  subnet_id         = null
  tags = {
    Name = "project2-monolith-natgw"
  }
  tags_all = {
    Name = "project2-monolith-natgw"
  }
  vpc_id = var.vpc_id
  availability_zone_address {
    allocation_ids       = ["eipalloc-04205e3d27be318c2"]
    availability_zone    = "ap-south-1b"
    availability_zone_id = "aps1-az3"
  }
  availability_zone_address {
    allocation_ids       = ["eipalloc-0f03657da91d68ae4"]
    availability_zone    = "ap-south-1a"
    availability_zone_id = "aps1-az1"
  }
}*/
