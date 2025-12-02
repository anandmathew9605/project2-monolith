# TASK 3.1: Bastion Host Configuration

**Date Completed:** December 01, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully provisioned a secure **Bastion Host (Jump Box)** in the public subnet.
- Provides SSH access to private application instances.
- Secured via Security Group (locked to Admin IP).
- Verified connectivity to private subnets.

---

## Resource Details

| Property | Value |
|----------|-------|
| **Instance Name** | project2-monolith-bastion |
| **Instance ID** | i-0ef733ddc4e4ae9e3 |
| **AMI** | Ubuntu Server 24.04 LTS |
| **Instance Type** | t3.micro |
| **VPC** | project2-monolith-vpc |
| **Subnet** | project2-monolith-public-subnet-1 (ap-south-1a) |
| **Public IP** | 43.205.240.36 |
| **Private IP** | 10.0.1.66 |
| **Security Group** | project2-monolith-bastion-sg |
| **Key Pair** | project2-monolith-key |

---

## Connectivity Validation

### 1. SSH Access (Admin → Bastion)
```bash
ssh -i project2-monolith-key.pem ubuntu@43.205.240.36
# Result: Successful Login
```

### 2. Jump Host Access (Admin → Bastion → Private Instance)
```bash
# Using SSH Agent Forwarding or ProxyJump
ssh -J ubuntu@43.205.240.36 ubuntu@10.0.11.x
# Result: Successful Login to Private Instance
```

---

## Validation Checklist ✅

- [x] Instance launched in Public Subnet AZ1
- [x] Public IP assigned
- [x] Security Group attached (SSH only)
- [x] SSH connectivity verified
- [x] Connectivity to private subnets verified

