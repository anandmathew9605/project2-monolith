# KMS Key (no dependencies)
/*import {
  to = aws_kms_key.main
  id = "39eed9a4-cdf0-4518-8d24-ce867a8e018b"
}

# Secrets Manager Secret (no dependencies)
  data "aws_secretsmanager_secret" "main" {
  arn = "arn:aws:secretsmanager:ap-south-1:608145123666:secret:rds!db-f74d77c4-e1fc-4c6f-a1c5-186320d65edb-wNVsVF"
}

# VPC (parent for everything - import first)
import {
  to = aws_vpc.main
  id = "vpc-07fb237e5b9e71a46"
}

# Subnets (need VPC first)

# Public Subnets
import {
  to = aws_subnet.public_az1
  id = "subnet-005a5ae3da9bc6770"
}

import {
  to = aws_subnet.public_az2
  id = "subnet-058b38a9ab1f26783"
}

# Private App Subnets
import {
  to = aws_subnet.private_app_az1
  id = "subnet-0a56be6593ebdd335"
}

import {
  to = aws_subnet.private_app_az2
  id = "subnet-0cc889380b4e6be88"
}

# Private DB Subnets
import {
  to = aws_subnet.private_db_az1
  id = "subnet-07e5bb36b93dafbff"
}

import {
  to = aws_subnet.private_db_az2
  id = "subnet-0b2bc76f9f77b1004"
}

# Internet Gateway (needs VPC)
import {
  to = aws_internet_gateway.main
  id = "igw-08c2fa207b601489a"
}
# Elastic IPs (no dependencies, but used by NAT)
import {
  to = aws_eip.nat_az1
  id = "eipalloc-0e6874fc08803a3c2"
}

import {
  to = aws_eip.nat_az2
  id = "eipalloc-07acd0f619adb1102"
}

# NAT Gateways (need EIPs + Subnets)
import {
  to = aws_nat_gateway.nat_az1
  id = "nat-077a74d9f14f00c5e"
}

import {
  to = aws_nat_gateway.nat_az2
  id = "nat-0ea1e7aa0e243691b"
}

# NAT Gateways Regional (need EIPs)
# Addon resource not created due to cost constraints
# Use this instead of the above two if needed
import {
  to = aws_nat_gateway.nat
  id = "nat-1cff8ac2b6f558d7d"
}

# Route Tables (need VPC)

# Public Route Table
import {
  to = aws_route_table.public
  id = "rtb-0836a359537138102"
}

# Private Route Table AZ1
import {
  to = aws_route_table.private_az1
  id = "rtb-05574f8872cd0bd58"
}

# Private Route Table AZ2
import {
  to = aws_route_table.private_az2
  id = "rtb-005363bec02a6b9ff"
}

# All 6 Security Groups (no dependencies on each other, just VPC)

# Application Load Balancer Security Group
import {
  to = aws_security_group.alb_sg
  id = "sg-0d313acfea76eefcc"
}

# Bastion Host (jump server) Security Group
import {
  to = aws_security_group.bastion_sg
  id = "sg-00ee03de8559eaec9"
}

# Zabbix Security Group
import {
  to = aws_security_group.zabbix_sg
  id = "sg-0d59931f3a8dfd2e9"
}

# Web Security Group
import {
  to = aws_security_group.web_sg
  id = "sg-0026c3feec4cf0e77"
}

# Application Security Group
import {
  to = aws_security_group.app_sg
  id = "sg-0fef92868d4536eed"
}

# Database Security Group
import {
  to = aws_security_group.db_sg
  id = "sg-09c26b84e667abfc1"
}

# Bastion Instance (needs SG, Subnet, Key Pair)
import {
  to = aws_instance.bastion
  id = "i-0ef733ddc4e4ae9e3"
}

# Launch Template (needs SG, Key Pair)
import {
  to = aws_launch_template.web_app
  id = "lt-0c42207fca3dc18df"
}

# Auto Scaling Group (needs Launch Template, Subnets)
import {
  to = aws_autoscaling_group.web_app
  id = "project2-monolith-asg"
}

# Application Load Balancer (needs SG, Subnets)
import {
  to = aws_lb.main
  id = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:loadbalancer/app/project2-monolith-alb/53d2cc1abc297f04"
}

# Target Group (needs VPC)
import {
  to = aws_lb_target_group.web_app
  id = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:targetgroup/project2-monolith-tg/2958670c7dc5cccd"
}

# ALB Listener (needs ALB, Target Group)
import {
  to = aws_lb_listener.http
  id = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:listener/app/project2-monolith-alb/53d2cc1abc297f04/8afde5ccdd5af3cb"
}

# DB Subnet Group (needs Subnets)
import {
  to = aws_db_subnet_group.main
  id = "project2-monolith"
}

# RDS Instance (needs DB Subnet Group, SG, Secrets)
import {
  to = aws_db_instance.main
  id = "project2-monolith-db"
}*/

