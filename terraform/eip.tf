# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "eipalloc-0e6874fc08803a3c2"
resource "aws_eip" "nat_az1" {
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = null
  domain                    = "vpc"
  network_border_group      = "ap-south-1"
  network_interface         = "eni-065be72c32a3fcd99"
  public_ipv4_pool          = "amazon"
  region                    = "ap-south-1"
  tags = {
    Name = "project2-monolith-eip-1"
  }
  tags_all = {
    Name    = "project2-monolith-eip-1"
    project = "project2-monolith"
  }
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "eipalloc-07acd0f619adb1102"
resource "aws_eip" "nat_az2" {
  address                   = null
  associate_with_private_ip = null
  customer_owned_ipv4_pool  = null
  domain                    = "vpc"
  network_border_group      = "ap-south-1"
  network_interface         = "eni-0870ad9d7beb121b9"
  public_ipv4_pool          = "amazon"
  region                    = "ap-south-1"
  tags = {
    Name = "project2-monolith-eip-2"
  }
  tags_all = {
    Name    = "project2-monolith-eip-2"
    project = "project2-monolith"
  }
}
