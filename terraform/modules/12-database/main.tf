# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "project2-monolith"
resource "aws_db_subnet_group" "main" {
  description = "DB subnet group for MySQL in private subnets"
  name        = "project2-monolith"
  region      = "ap-south-1"
  subnet_ids  = ["subnet-0a2d28ad572417987", "subnet-05f0f6ac797abea0a"]
  tags        = {}
  tags_all    = {}
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_db_instance" "main" {
  allocated_storage           = 20
  allow_major_version_upgrade = null
  apply_immediately           = null
  auto_minor_version_upgrade  = true
  availability_zone           = "ap-south-1b"
  backup_retention_period     = 7
  backup_target               = "region"
  backup_window               = "18:33-19:03"
  ca_cert_identifier          = "rds-ca-rsa2048-g1"
  copy_tags_to_snapshot       = true
  custom_iam_instance_profile = null
  customer_owned_ip_enabled   = false
  database_insights_mode      = "standard"
  db_name                     = "monolithdb"
  db_subnet_group_name        = "project2-monolith"
  dedicated_log_volume        = false
  delete_automated_backups    = true
  deletion_protection         = false
  domain                      = null
  domain_auth_secret_arn      = null
  #domain_dns_ips                        = []
  domain_iam_role_name                  = null
  domain_ou                             = null
  enabled_cloudwatch_logs_exports       = []
  engine                                = "mysql"
  engine_lifecycle_support              = "open-source-rds-extended-support-disabled"
  engine_version                        = "8.0.43"
  final_snapshot_identifier             = null
  iam_database_authentication_enabled   = false
  identifier                            = "project2-monolith-db"
  instance_class                        = "db.t3.micro"
  iops                                  = 3000
  kms_key_id                            = "arn:aws:kms:ap-south-1:608145123666:key/39eed9a4-cdf0-4518-8d24-ce867a8e018b"
  license_model                         = "general-public-license"
  maintenance_window                    = "sun:09:53-sun:10:23"
  manage_master_user_password           = null
  max_allocated_storage                 = 1000
  monitoring_interval                   = 60
  monitoring_role_arn                   = "arn:aws:iam::608145123666:role/rds-monitoring-role"
  multi_az                              = true
  network_type                          = "IPV4"
  option_group_name                     = "default:mysql-8-0"
  parameter_group_name                  = "default.mysql8.0"
  password                              = null # sensitive
  password_wo                           = null # sensitive
  password_wo_version                   = null
  performance_insights_enabled          = false
  performance_insights_retention_period = 0
  port                                  = 3306
  publicly_accessible                   = false
  region                                = "ap-south-1"
  replicate_source_db                   = null
  skip_final_snapshot                   = true
  storage_encrypted                     = true
  storage_throughput                    = 125
  storage_type                          = "gp3"
  tags                                  = {}
  tags_all = {
    project = "project2-monolith"
  }
  upgrade_storage_config = null
  username               = "admin"
  vpc_security_group_ids = ["sg-06f5023375e929f9a"]
}
