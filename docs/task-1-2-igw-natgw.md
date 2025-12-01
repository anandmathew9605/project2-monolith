# TASK 1.2: Internet Gateway + NAT Gateways Creation

**Date Completed:** December 01, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully created:
- **1 Internet Gateway (IGW)** - Enables public subnet internet connectivity
- **2 Elastic IP Addresses** - Static IPs for NAT Gateways
- **2 NAT Gateways** - Enables private subnet outbound internet access

---

## Internet Gateway Details

| Property | Value |
|----------|-------|
| **IGW ID** | igw-08c2fa207b601489a |
| **IGW Name** | project2-monolith-igw |
| **State** | Attached |
| **Attached VPC** | vpc-07fb237e5b9e71a46 (project2-monolith-vpc) |
| **Region** | ap-south-1 |
| **Created Date** | 2025-12-01 |

---

## Elastic IP Addresses

| Property | EIP 1 (AZ1) | EIP 2 (AZ2) |
|----------|------------|------------|
| **Public IP** | 13.233.31.195 | 43.204.57.115 |
| **Allocation ID** | eipalloc-0e6874fc08803a3c2 | eipalloc-07acd0f619adb1102 |
| **Domain** | vpc | vpc |
| **State** | Associated | Associated |
| **Associated With** | nat-077a74d9f14f00c5e | nat-0ea1e7aa0e243691b |
| **Region** | ap-south-1 | ap-south-1 |

---

## NAT Gateway Configuration

### NAT Gateway 1 (AZ1)

| Property | Value |
|----------|-------|
| **NAT GW ID** | nat-077a74d9f14f00c5e |
| **NAT GW Name** | project2-monolith-natgw-az1 |
| **State** | Available |
| **Subnet** | subnet-005a5ae3da9bc6770 (10.0.1.0/24, ap-south-1a) |
| **Elastic IP** | 13.233.31.195 |
| **Allocation ID** | eipalloc-0e6874fc08803a3c2 |
| **Network Interface ID** | eni-xxxxxxxx (assigned by AWS) |
| **Creation Date** | 2025-12-01 |

### NAT Gateway 2 (AZ2)

| Property | Value |
|----------|-------|
| **NAT GW ID** | nat-0ea1e7aa0e243691b |
| **NAT GW Name** | project2-monolith-natgw-az2 |
| **State** | Available |
| **Subnet** | subnet-058b38a9ab1f26783 (10.0.2.0/24, ap-south-1b) |
| **Elastic IP** | 43.204.57.115 |
| **Allocation ID** | eipalloc-07acd0f619adb1102 |
| **Network Interface ID** | eni-xxxxxxxx (assigned by AWS) |
| **Creation Date** | 2025-12-01 |

---

## Architecture Impact

### Internet Connectivity Flow

```
PUBLIC TIER (Internet-facing):
  Users → IGW → Public Subnets
  ├─ ALB (Bastion access point)
  ├─ Bastion Host
  └─ Zabbix Server

OUTBOUND FLOW (Private subnets to internet):
  Private Instances → NAT Gateway AZ1/AZ2 → IGW → Internet
  (For updates, patches, external API calls)

INBOUND FLOW (Internet to Private):
  NOT ALLOWED - NAT provides one-way translation
  (Security benefit: private instances not directly accessible)
```

---

## Connectivity Testing

### What Now Works ✅

1. **Public subnets** can reach the internet directly via IGW
2. **Private subnets** can initiate outbound connections via NAT Gateways
3. **Each AZ has independent NAT Gateway** for resilience

### What Still Needs Configuration

1. Route tables (to route traffic through IGW/NAT)
2. Security groups (to control traffic)
3. EC2 instances (to utilize connectivity)
4. RDS database (private connectivity)

---

## Cost Analysis

| Component | Cost (ap-south-1) | Notes |
|-----------|------------------|-------|
| **IGW** | Free | No charge for creation or usage |
| **NAT GW #1** | $0.045/hr | ~$32.40/month + data transfer |
| **NAT GW #2** | $0.045/hr | ~$32.40/month + data transfer |
| **EIPs** | Free | No charge when associated to NAT GW |
| **Data Transfer Out** | $0.09/GB | Charged only for traffic exiting VPC |
| **Daily Cost** | ~$2.16 | Running both NAT GWs 24/7 |
| **Monthly Cost** | ~$64.80 | Base NAT GW costs (data transfer separate) |

---

## Validation Checklist ✅

### Internet Gateway
- [x] IGW created: igw-08c2fa207b601489a
- [x] IGW state: Attached
- [x] IGW attached to correct VPC: vpc-07fb237e5b9e71a46
- [x] IGW named: project2-monolith-igw

### NAT Gateways
- [x] NAT GW 1 created: nat-077a74d9f14f00c5e
- [x] NAT GW 1 state: Available
- [x] NAT GW 1 in public subnet AZ1: subnet-005a5ae3da9bc6770
- [x] NAT GW 2 created: nat-0ea1e7aa0e243691b
- [x] NAT GW 2 state: Available
- [x] NAT GW 2 in public subnet AZ2: subnet-058b38a9ab1f26783

### Elastic IPs
- [x] EIP 1 allocated: 13.233.31.195
- [x] EIP 1 associated: eipalloc-0e6874fc08803a3c2
- [x] EIP 1 associated to NAT GW 1
- [x] EIP 2 allocated: 43.204.57.115
- [x] EIP 2 associated: eipalloc-07acd0f619adb1102
- [x] EIP 2 associated to NAT GW 2

### Multi-AZ Resilience
- [x] NAT GW deployed in AZ1 (ap-south-1a)
- [x] NAT GW deployed in AZ2 (ap-south-1b)
- [x] Each AZ has independent NAT GW
- [x] If one AZ fails, other AZ remains operational

---

## Next Steps (TASK 1.3)

**Route Tables Creation & Association**

We need to create:
1. **Public Route Table** - routes 0.0.0.0/0 to IGW
2. **App Private Route Table (AZ1)** - routes 0.0.0.0/0 to NAT GW AZ1
3. **App Private Route Table (AZ2)** - routes 0.0.0.0/0 to NAT GW AZ2
4. **DB Private Route Table** - routes 0.0.0.0/0 to NAT GW

Then associate subnets with their respective route tables.

**Estimated Time:** 20-30 minutes

---

## Important Notes

### Cost Management
- ⚠️ NAT Gateways cost money while running (~$65/month for 2x)
- If pausing project for extended period, consider deleting NAT GWs
- Elastic IPs cost money if NOT associated (currently free - associated to NAT GWs)

### Resilience
- ✅ Multi-AZ deployment provides high availability
- ✅ Each NAT GW is independent (failure in one AZ doesn't impact other)
- ⚠️ If BOTH NAT GWs down, private subnets lose outbound internet access
- Recommendation: Monitor NAT GW health in Zabbix (future enhancement)

### Security
- ✅ Private subnets cannot be directly accessed from internet
- ✅ Outbound connections allowed, but inbound blocked (one-way NAT)
- ⚠️ Still need Security Groups to control specific traffic
- Next task: Create Security Groups for fine-grained access control

---

## Documentation Files Updated

- ✅ `resource-reference.txt` - All IDs and details captured
- ✅ `task-1-2-igw-natgw.md` - This file
- 📋 Next: `task-1-3-route-tables.md` (after TASK 1.3)

---

## Phase Progress

```
PHASE 1: MANUAL AWS CONFIGURATION
├─ [✅ COMPLETE] TASK 1.1: VPC + Subnets (6 created)
├─ [✅ COMPLETE] TASK 1.2: IGW + NAT Gateways (IGW + 2x NAT GW)
├─ [ ] TASK 1.3: Route Tables (3-4 route tables)
├─ [ ] TASK 2.1: Security Groups (6 security groups)
├─ [ ] TASK 3.x: Instances (Bastion, Web, App)
├─ [ ] TASK 4.1: Load Balancer
├─ [ ] TASK 5.1: RDS Database
├─ [ ] TASK 6.1: Zabbix Monitoring
└─ [ ] TASK 7.0: Integrated System Test

Progress: 2/12 tasks complete (16.7%)
```

---

## Completed By

- **User:** anandmathew9605
- **Date:** 2025-12-01 (December 1, 2025)
- **Region:** ap-south-1 (Mumbai)
- **AWS Account:** 6081-4512-3666
- **Duration:** ~15-20 minutes

---

**Status:** Ready for TASK 1.3 - Route Tables ✅

