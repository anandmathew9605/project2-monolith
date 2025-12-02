# TASK 4.1: Application Load Balancer Configuration

**Date Completed:** December 02, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully provisioned an **Application Load Balancer (ALB)** to provide public HTTP access to private instances.
- ALB deployed in public subnets across 2 Availability Zones.
- Target Group configured to route traffic to Auto Scaling Group instances.
- Health checks enabled to ensure traffic only goes to healthy instances.
- ALB DNS tested and verified working.

---

## Application Load Balancer

| Property | Value |
|----------|-------|
| **Name** | project2-monolith-alb |
| **ARN** | arn:aws:elasticloadbalancing:ap-south-1:... |
| **DNS Name** | project2-monolith-alb-1168601212.ap-south-1.elb.amazonaws.com |
| **Type** | Application Load Balancer |
| **Scheme** | Internet-facing |
| **IP Address Type** | IPv4 |
| **VPC** | project2-monolith-vpc |
| **Availability Zones** | ap-south-1a, ap-south-1b |
| **Subnets** | project2-monolith-public-subnet-1, project2-monolith-public-subnet-2 |
| **Security Group** | project2-monolith-alb-sg |

---

## Target Group

| Property | Value |
|----------|-------|
| **Name** | project2-monolith-tg |
| **Target Type** | Instances |
| **Protocol** | HTTP |
| **Port** | 80 |
| **VPC** | project2-monolith-vpc |
| **Health Check Protocol** | HTTP |
| **Health Check Path** | / |
| **Health Check Interval** | 30 seconds |
| **Healthy Threshold** | 2 |
| **Unhealthy Threshold** | 2 |

---

## Listener Configuration

| Property | Value |
|----------|-------|
| **Protocol** | HTTP |
| **Port** | 80 |
| **Default Action** | Forward to project2-monolith-tg |

---

## Target Registration

| Target Instance | Instance ID | Private IP | AZ | Health Status |
|----------------|-------------|-----------|-----|---------------|
| ASG Instance 1 | i-0d467f29f260c8c61 | 10.0.11.x | ap-south-1a | Healthy ✅ |
| ASG Instance 2 | i-0ae27afea8c60c5a5 | 10.0.12.x | ap-south-1b | Healthy ✅ |

**Note:** Instances automatically registered via Auto Scaling Group integration.

---

## ALB Testing Results

### Test 1: Basic Connectivity
```bash
curl http://project2-monolith-alb-1168601212.ap-south-1.elb.amazonaws.com/
# Result: HTML page returned successfully
```

### Test 2: Load Balancing Verification
- Multiple requests distributed across both instances
- Hostname and private IP displayed correctly for each instance
- Both AZs responding correctly

### Test 3: Health Check Validation
- ALB marks instances as Healthy when Apache returns 200 OK
- Traffic only routed to healthy targets

---

## Traffic Flow

```
Internet User
    ↓
ALB DNS (project2-monolith-alb-1168601212.ap-south-1.elb.amazonaws.com)
    ↓
ALB (Public Subnets - ap-south-1a, ap-south-1b)
    ↓
Target Group (project2-monolith-tg)
    ↓
ASG Instances (Private App Subnets - 10.0.11.0/24, 10.0.12.0/24)
    ↓
Apache Web Server (Port 80)
```

---

## Security Groups

### ALB Security Group (project2-monolith-alb-sg)
**Inbound:**
- HTTP (80) from 0.0.0.0/0
- HTTPS (443) from 0.0.0.0/0

**Outbound:**
- All traffic to 0.0.0.0/0

### Instance Security Groups
**Inbound (Web SG):**
- HTTP (80) from ALB SG only

This ensures instances only accept traffic from the ALB, not directly from the internet.

---

## Validation Checklist ✅

- [x] ALB created in public subnets
- [x] ALB spans both Availability Zones
- [x] ALB Security Group attached (allows HTTP/HTTPS)
- [x] Target Group created with health checks
- [x] ASG configured to register instances automatically
- [x] Both instances registered and marked Healthy
- [x] ALB DNS resolves and returns content
- [x] Load balancing verified across both instances

---

## Next Steps

**TASK 5.1:** Create RDS MySQL Database in private DB subnets

**Estimated Time:** 25-30 minutes

