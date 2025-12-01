# TASK 1.1: VPC & Subnets Creation

**Date Completed:** December 01, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## VPC Details

| Property | Value |
|----------|-------|
| **VPC ID** | vpc-07fb237e5b9e71a46 |
| **VPC Name** | project2-monolith-vpc |
| **CIDR Block** | 10.0.0.0/16 |
| **Region** | ap-south-1 (Mumbai) |
| **State** | Available |
| **DNS Hostname Resolution** | Enabled |
| **DNS Hostname Support** | Enabled |

---

## Subnets Created (6 Total)

### Public Subnets (Web/Frontend & Management)

| Tier | Name | Subnet ID | CIDR Block | Availability Zone | State | Auto-assign Public IP |
|------|------|-----------|------------|-------------------|-------|----------------------|
| Public | project2-monolith-public-subnet-1 | subnet-005a5ae3da9bc6770 | 10.0.1.0/24 | ap-south-1a | Available | Yes |
| Public | project2-monolith-public-subnet-2 | subnet-058b38a9ab1f26783 | 10.0.2.0/24 | ap-south-1b | Available | Yes |

### Private Subnets - Application Tier

| Tier | Name | Subnet ID | CIDR Block | Availability Zone | State | Auto-assign Public IP |
|------|------|-----------|------------|-------------------|-------|----------------------|
| Private-App | project2-monolith-app-subnet-1 | subnet-0a56be6593ebdd335 | 10.0.11.0/24 | ap-south-1a | Available | No |
| Private-App | project2-monolith-app-subnet-2 | subnet-0cc889380b4e6be88 | 10.0.12.0/24 | ap-south-1b | Available | No |

### Private Subnets - Database Tier

| Tier | Name | Subnet ID | CIDR Block | Availability Zone | State | Auto-assign Public IP |
|------|------|-----------|------------|-------------------|-------|----------------------|
| Private-DB | project2-monolith-db-subnet-1 | subnet-07e5bb36b93dafbff | 10.0.21.0/24 | ap-south-1a | Available | No |
| Private-DB | project2-monolith-db-subnet-2 | subnet-0b2bc76f9f7fb1004 | 10.0.22.0/24 | ap-south-1b | Available | No |

---

## CIDR Allocation Summary

```
VPC CIDR: 10.0.0.0/16 (65,536 total IPs)

PUBLIC TIER (Web/Frontend)
├─ 10.0.1.0/24    (256 IPs)   → project2-monolith-public-subnet-1 (ap-south-1a)
└─ 10.0.2.0/24    (256 IPs)   → project2-monolith-public-subnet-2 (ap-south-1b)

PRIVATE APP TIER (Backend)
├─ 10.0.11.0/24   (256 IPs)   → project2-monolith-app-subnet-1 (ap-south-1a)
└─ 10.0.12.0/24   (256 IPs)   → project2-monolith-app-subnet-2 (ap-south-1b)

PRIVATE DB TIER (Database)
├─ 10.0.21.0/24   (256 IPs)   → project2-monolith-db-subnet-1 (ap-south-1a)
└─ 10.0.22.0/24   (256 IPs)   → project2-monolith-db-subnet-2 (ap-south-1b)

RESERVED FOR FUTURE EXPANSION:
├─ 10.0.3.0/24 through 10.0.10.0/24 (available)
├─ 10.0.13.0/24 through 10.0.20.0/24 (available)
└─ 10.0.23.0/24 through 10.0.255.0/24 (available)
```

---

## Availability Zones

| AZ | Region | Public Subnet | App Private Subnet | DB Private Subnet |
|----|----|----------|----------|----------|
| ap-south-1a | Mumbai-A | 10.0.1.0/24 | 10.0.11.0/24 | 10.0.21.0/24 |
| ap-south-1b | Mumbai-B | 10.0.2.0/24 | 10.0.12.0/24 | 10.0.22.0/24 |

---

## Validation Checklist ✅

### VPC
- [x] VPC created with CIDR 10.0.0.0/16
- [x] VPC named: project2-monolith-vpc
- [x] VPC state: Available
- [x] DNS hostname resolution: Enabled
- [x] DNS hostname support: Enabled

### Public Subnets
- [x] project2-monolith-public-subnet-1 created (10.0.1.0/24, ap-south-1a)
- [x] project2-monolith-public-subnet-2 created (10.0.2.0/24, ap-south-1b)
- [x] Auto-assign public IPv4: ENABLED for both
- [x] Subnets state: Available

### Private App Subnets
- [x] project2-monolith-app-subnet-1 created (10.0.11.0/24, ap-south-1a)
- [x] project2-monolith-app-subnet-2 created (10.0.12.0/24, ap-south-1b)
- [x] Auto-assign public IPv4: DISABLED for both
- [x] Subnets state: Available

### Private DB Subnets
- [x] project2-monolith-db-subnet-1 created (10.0.21.0/24, ap-south-1a)
- [x] project2-monolith-db-subnet-2 created (10.0.22.0/24, ap-south-1b)
- [x] Auto-assign public IPv4: DISABLED for both
- [x] Subnets state: Available

### Overall
- [x] Total 6 subnets created
- [x] All subnets in project2-monolith-vpc
- [x] Subnets span across ap-south-1a and ap-south-1b
- [x] No CIDR conflicts
- [x] All resources tagged correctly

---

## Cost Impact

| Component | Cost |
|-----------|------|
| VPC Creation | Free |
| Subnet Creation (6x) | Free |
| **Total TASK 1.1** | **Free** |
| **Running Charges** | None yet |

*Note: Charges will begin when we create Internet Gateway (free) and NAT Gateways (~$14/month each in ap-south-1)*

---

## Next Steps

**TASK 1.2:** Create Internet Gateway + NAT Gateways

What we'll create:
- 1 Internet Gateway (IGW) for public subnet internet access
- 2 Elastic IP Addresses (EIPs) for NAT Gateways
- 2 NAT Gateways (one per AZ) for private subnet outbound connectivity

**Estimated Time:** 20-30 minutes

---

## Screenshots

- Screenshot saved: AWS VPC Console → All 6 subnets visible
- State: All "Available"
- Filter applied: VPC: vpc-07fb237e5b9e71a46

---

## Completed By

- **User:** anandmathew9605
- **Date:** 2025-12-01 (Dec 1, 2025)
- **Region:** ap-south-1 (Mumbai)
- **AWS Account:** 6081-4512-3666

