# TASK 3.2: Auto Scaling Group & Launch Template

**Date Completed:** December 01, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully created an **Auto Scaling Group** with **Launch Template** to provision web/app instances in private subnets.
- Instances run Ubuntu 24.04 LTS with minimal bootstrap (Python for Ansible).
- Deployed across 2 Availability Zones for high availability.
- Security Groups enforce strict network access controls.

---

## Launch Template

| Property | Value |
|----------|-------|
| **Name** | project2-monolith-lt |
| **Launch Template ID** | lt-0c42207fca3dc18df |
| **AMI** | Ubuntu Server 24.04 LTS |
| **Instance Type** | t3.micro |
| **Key Pair** | project2-monolith-key |
| **Security Groups** | project2-monolith-web-sg, project2-monolith-app-sg |
| **Root Volume** | 8 GiB gp3 |

### User Data Script
```bash
#!/bin/bash
apt-get update -y
apt-get install -y python3 python3-pip
echo "User data executed at $(date)" > /var/log/userdata-execution.log
```

---

## Auto Scaling Group

| Property | Value |
|----------|-------|
| **Name** | project2-monolith-asg |
| **Launch Template** | project2-monolith-lt |
| **VPC** | project2-monolith-vpc |
| **Subnets** | project2-monolith-app-subnet-1 (ap-south-1a), project2-monolith-app-subnet-2 (ap-south-1b) |
| **Min Capacity** | 1 |
| **Desired Capacity** | 2 |
| **Max Capacity** | 2 |
| **Health Check Grace Period** | 300 seconds |
| **Target Group** | project2-monolith-tg |

---

## Instances Launched

| Instance Name | Instance ID | Private IP | AZ | Status |
|--------------|-------------|-----------|-----|--------|
| project2-monolith-asg-instance | i-0d467f29f260c8c61 | 10.0.11.x | ap-south-1a | Running |
| project2-monolith-asg-instance | i-0ae27afea8c60c5a5 | 10.0.12.x | ap-south-1b | Running |

---

## Security Groups Applied

Both instances have **two security groups** attached:

### project2-monolith-web-sg
- HTTP (80) from ALB SG
- SSH (22) from Bastion SG
- TCP 10050 from Zabbix SG

### project2-monolith-app-sg
- TCP 9000 from Web SG
- SSH (22) from Bastion SG
- TCP 10050 from Zabbix SG

---

## Validation Checklist ✅

- [x] Launch Template created with correct AMI and instance type
- [x] ASG created in private app subnets
- [x] 2 instances launched (one per AZ)
- [x] Instances have no public IPs
- [x] SSH access verified via Bastion
- [x] Python installed and user data executed

