# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "igw-08c2fa207b601489a"
resource "aws_internet_gateway" "main" {
  region = "ap-south-1"
  tags = {
    Name = "project2-monolith-igw"
  }
  tags_all = {
    Name    = "project2-monolith-igw"
    project = "project2-monolith"
  }
  vpc_id = var.vpc_id
}
