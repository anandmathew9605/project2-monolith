# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "bastion" {
  ami                                  = "ami-02b8269d5e85954ef"
  associate_public_ip_address          = true
  availability_zone                    = "ap-south-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  #ipv6_address_count                   = 0
  #ipv6_addresses                       = []
  key_name                   = "project2-monolith-key"
  monitoring                 = false
  placement_partition_number = 0
  private_ip                 = "10.0.1.66"
  region                     = "ap-south-1"
  secondary_private_ips      = []
  security_groups            = []
  source_dest_check          = true
  subnet_id                  = "subnet-05152d60592905153"
  tags = {
    Name = "project2-monolith-bastion"
  }
  tags_all = {
    Name    = "project2-monolith-bastion"
    project = "project2-monolith"
  }
  tenancy                     = "default"
  user_data                   = "#!/bin/bash\napt-get update -y\napt-get install -y python3 python3-pip\n\n"
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-06f5023375e929f9a"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  /*primary_network_interface {
    network_interface_id = "eni-06baed252ca568736"
  }*/
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags = {
      project = "project2-monolith"
    }
    tags_all = {
      project = "project2-monolith"
    }
    throughput  = 125
    volume_size = 8
    volume_type = "gp3"
  }
}


# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_launch_template" "web_app" {
  default_version                      = 1
  description                          = "Launch template for web & app tier (Apache + PHP) with necessary package"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = null
  image_id                             = "ami-02b8269d5e85954ef"
  instance_initiated_shutdown_behavior = null
  instance_type                        = "t3.micro"
  kernel_id                            = null
  key_name                             = "project2-monolith-key"
  name                                 = "project2-monolith-lt"
  ram_disk_id                          = null
  region                               = "ap-south-1"
  #security_group_names                 = []
  tags = {}
  tags_all = {
    project = "project2-monolith"
  }
  update_default_version = null
  user_data              = "IyEvYmluL2Jhc2gKYXB0LWdldCB1cGRhdGUgLXkKYXB0LWdldCBpbnN0YWxsIC15IHB5dGhvbjMgcHl0aG9uMy1waXAKCiMgQ3JlYXRlIG1hcmtlciBmaWxlCmVjaG8gIlVzZXIgZGF0YSBleGVjdXRlZCBhdCAkKGRhdGUpIiA+IC92YXIvbG9nL3VzZXJkYXRhLWV4ZWN1dGlvbi5sb2cK"
  vpc_security_group_ids = ["sg-06f5023375e929f9a"]
  tag_specifications {
    resource_type = "instance"
    tags = {
      project = "project2-monolith"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      project = "project2-monolith"
    }
  }
  tag_specifications {
    resource_type = "network-interface"
    tags = {
      project = "project2-monolith"
    }
  }
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_autoscaling_group" "web_app" {
  #availability_zones               = ["ap-south-1a", "ap-south-1b"]
  capacity_rebalance               = false
  context                          = null
  default_cooldown                 = 300
  default_instance_warmup          = 0
  desired_capacity                 = 0
  desired_capacity_type            = null
  enabled_metrics                  = []
  force_delete                     = null
  force_delete_warm_pool           = null
  health_check_grace_period        = 300
  health_check_type                = "EC2"
  ignore_failed_scaling_activities = null
  launch_configuration             = null
  #load_balancers                   = []
  max_instance_lifetime     = 0
  max_size                  = 2
  metrics_granularity       = "1Minute"
  min_elb_capacity          = null
  min_size                  = 0
  name                      = "project2-monolith-asg"
  placement_group           = null
  protect_from_scale_in     = false
  region                    = "ap-south-1"
  service_linked_role_arn   = "arn:aws:iam::608145123666:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  suspended_processes       = []
  target_group_arns         = ["arn:aws:elasticloadbalancing:ap-south-1:608145123666:targetgroup/project2-monolith-tg/9f117ccee254993a"]
  termination_policies      = []
  vpc_zone_identifier       = ["subnet-00a201c4748a71cfc", "subnet-04b517c7f5f9026cb"]
  wait_for_capacity_timeout = null
  wait_for_elb_capacity     = null
  availability_zone_distribution {
    capacity_distribution_strategy = "balanced-best-effort"
  }
  capacity_reservation_specification {
    capacity_reservation_preference = "default"
  }
  launch_template {
    id = "lt-055384049e4606d45"
    #name    = "project2-monolith-lt"
    version = "1"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "project2-monolith-asg-instance"
  }
  tag {
    key                 = "project"
    propagate_at_launch = true
    value               = "project2-monolith"
  }
  /*traffic_source {
    identifier = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:targetgroup/project2-monolith-tg/2958670c7dc5cccd"
    type       = "elbv2"
  }*/
}
