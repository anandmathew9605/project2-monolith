# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route_table" "public" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw
  }
  tags = {
    Name = "project2-monolith-public-rt"
  }
  tags_all = {
    Name    = "project2-monolith-public-rt"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}

/*# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route_table" "private_az1" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-077a74d9f14f00c5e"
  }
  tags = {
    Name = "project2-monolith-private-rt1"
  }
  tags_all = {
    Name    = "project2-monolith-private-rt1"
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_route_table" "private_az2" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-0ea1e7aa0e243691b"
  }
  tags = {
    Name = "project2-monolith-private-rt2"
  }
  tags_all = {
    Name    = "project2-monolith-private-rt2"
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}*/
