# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_lb" "main" {
  client_keep_alive                           = 3600
  customer_owned_ipv4_pool                    = null
  desync_mitigation_mode                      = "defensive"
  dns_record_client_routing_policy            = null
  drop_invalid_header_fields                  = false
  enable_cross_zone_load_balancing            = true
  enable_deletion_protection                  = false
  enable_http2                                = true
  enable_tls_version_and_cipher_suite_headers = false
  enable_waf_fail_open                        = false
  enable_xff_client_port                      = false
  enable_zonal_shift                          = false
  idle_timeout                                = 60
  internal                                    = false
  ip_address_type                             = "ipv4"
  load_balancer_type                          = "application"
  name                                        = "project2-monolith-alb"
  preserve_host_header                        = false
  region                                      = "ap-south-1"
  security_groups                             = ["sg-0d313acfea76eefcc"]
  subnets                                     = ["subnet-005a5ae3da9bc6770", "subnet-058b38a9ab1f26783"]
  tags                                        = {}
  tags_all = {
    project = "project2-monolith"
  }
  xff_header_processing_mode = "append"
  access_logs {
    bucket  = ""
    enabled = false
    prefix  = null
  }
  connection_logs {
    bucket  = ""
    enabled = false
    prefix  = null
  }
  /*subnet_mapping {
    allocation_id        = null
    ipv6_address         = null
    private_ipv4_address = null
    subnet_id            = "subnet-005a5ae3da9bc6770"
  }
  subnet_mapping {
    allocation_id        = null
    ipv6_address         = null
    private_ipv4_address = null
    subnet_id            = "subnet-058b38a9ab1f26783"
  }*/
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_lb_target_group" "web_app" {
  deregistration_delay               = "300"
  ip_address_type                    = "ipv4"
  lambda_multi_value_headers_enabled = null
  load_balancing_algorithm_type      = "round_robin"
  load_balancing_anomaly_mitigation  = "off"
  load_balancing_cross_zone_enabled  = "use_load_balancer_configuration"
  name                               = "project2-monolith-tg"
  port                               = 80
  protocol                           = "HTTP"
  protocol_version                   = "HTTP1"
  proxy_protocol_v2                  = null
  region                             = "ap-south-1"
  slow_start                         = 0
  tags                               = {}
  tags_all = {
    project = "project2-monolith"
  }
  target_type = "instance"
  vpc_id      = "vpc-07fb237e5b9e71a46"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  stickiness {
    cookie_duration = 86400
    cookie_name     = null
    enabled         = false
    type            = "lb_cookie"
  }
  /*target_failover {
    on_deregistration = null
    on_unhealthy      = null
  }*/
  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
    unhealthy_state_routing {
      minimum_healthy_targets_count      = 1
      minimum_healthy_targets_percentage = "off"
    }
  }
  /*target_health_state {
    enable_unhealthy_connection_termination = null
    unhealthy_draining_interval             = null
  }*/
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "arn:aws:elasticloadbalancing:ap-south-1:608145123666:listener/app/project2-monolith-alb/53d2cc1abc297f04/8afde5ccdd5af3cb"
resource "aws_lb_listener" "http" {
  alpn_policy                          = null
  certificate_arn                      = null
  load_balancer_arn                    = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:loadbalancer/app/project2-monolith-alb/53d2cc1abc297f04"
  port                                 = 80
  protocol                             = "HTTP"
  region                               = "ap-south-1"
  routing_http_response_server_enabled = true
  tags                                 = {}
  tags_all                             = {}
  default_action {
    order            = 1
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:targetgroup/project2-monolith-tg/2958670c7dc5cccd"
    type             = "forward"
    forward {
      stickiness {
        duration = 3600
        enabled  = false
      }
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:608145123666:targetgroup/project2-monolith-tg/2958670c7dc5cccd"
        weight = 1
      }
    }
  }
}
