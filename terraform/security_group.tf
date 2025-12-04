# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0d313acfea76eefcc"
resource "aws_security_group" "alb_sg" {
  description = "Allows public web traffic (HTTP/HTTPS)"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "project2-monolith-alb-sg"
  region                 = "ap-south-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}

# __generated__ by Terraform from "sg-0026c3feec4cf0e77"
resource "aws_security_group" "web_sg" {
  description = "Allows traffic from ALB, Bastion, and Zabbix"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 10050
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0d59931f3a8dfd2e9"]
    self             = false
    to_port          = 10050
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-00ee03de8559eaec9"]
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0d313acfea76eefcc"]
    self             = false
    to_port          = 80
  }]
  name                   = "project2-monolith-web-sg"
  region                 = "ap-south-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}

# __generated__ by Terraform from "sg-09c26b84e667abfc1"
resource "aws_security_group" "db_sg" {
  description = "Allows MySQL traffic from App tier and Bastion"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 3306
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-00ee03de8559eaec9", "sg-0fef92868d4536eed"]
    self             = false
    to_port          = 3306
  }]
  name                   = "project2-monolith-db-sg"
  region                 = "ap-south-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}

# __generated__ by Terraform from "sg-0fef92868d4536eed"
resource "aws_security_group" "app_sg" {
  description = "Allows traffic from Web tier, Bastion, Zabbix"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 10050
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-00ee03de8559eaec9"]
    self             = false
    to_port          = 10050
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-00ee03de8559eaec9"]
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 9000
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0026c3feec4cf0e77"]
    self             = false
    to_port          = 9000
  }]
  name                   = "project2-monolith-app-sg"
  region                 = "ap-south-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}

# __generated__ by Terraform from "sg-00ee03de8559eaec9"
resource "aws_security_group" "bastion_sg" {
  description = "Allows SSH access from a specific IP"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["49.37.232.176/32"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "project2-monolith-bastion-sg"
  region                 = "ap-south-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}

# __generated__ by Terraform from "sg-0d59931f3a8dfd2e9"
resource "aws_security_group" "zabbix_sg" {
  description = "Allows access to Zabbix UI and management"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = []
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-00ee03de8559eaec9"]
    self             = false
    to_port          = 22
  }]
  name                   = "project2-monolith-zabbix-sg"
  region                 = "ap-south-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all = {
    project = "project2-monolith"
  }
  vpc_id = "vpc-07fb237e5b9e71a46"
}
