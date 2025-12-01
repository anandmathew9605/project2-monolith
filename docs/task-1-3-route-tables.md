# TASK 1.3: Route Tables Configuration

**Date Completed:** December 01, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully configured network routing for:
- **Public Traffic:** 1 Route Table directing traffic to Internet Gateway
- **Private Traffic (AZ1):** 1 Route Table directing traffic to NAT Gateway AZ1
- **Private Traffic (AZ2):** 1 Route Table directing traffic to NAT Gateway AZ2

This configuration ensures **Multi-AZ High Availability** for outbound connectivity.

---

## Route Tables Created

### 1. Public Route Table

| Property | Value |
|----------|-------|
| **Route Table ID** | rtb-0836a359537138102 |
| **Name** | project2-monolith-public-rt |
| **Main Route Table** | No |
| **VPC** | vpc-07fb237e5b9e71a46 |

**Routes:**
| Destination | Target | Status | Description |
|-------------|--------|--------|-------------|
| 10.0.0.0/16 | local | Active | Local VPC traffic |
| 0.0.0.0/0 | igw-08c2fa207b601489a | Active | Internet Access via IGW |

**Subnet Associations (2 subnets):**
- `project2-monolith-public-subnet-1` (10.0.1.0/24)
- `project2-monolith-public-subnet-2` (10.0.2.0/24)

---

### 2. Private Route Table AZ1 (App & DB)

| Property | Value |
|----------|-------|
| **Route Table ID** | rtb-05574f8872cd0bd58 |
| **Name** | project2-monolith-private-rt1 |
| **VPC** | vpc-07fb237e5b9e71a46 |

**Routes:**
| Destination | Target | Status | Description |
|-------------|--------|--------|-------------|
| 10.0.0.0/16 | local | Active | Local VPC traffic |
| 0.0.0.0/0 | nat-077a74d9f14f00c5e | Active | Outbound via NAT GW AZ1 |

**Subnet Associations (2 subnets):**
- `project2-monolith-app-subnet-1` (10.0.11.0/24)
- `project2-monolith-db-subnet-1` (10.0.21.0/24)

---

### 3. Private Route Table AZ2 (App & DB)

| Property | Value |
|----------|-------|
| **Route Table ID** | rtb-005363bec02a6b9ff |
| **Name** | project2-monolith-private-rt2 |
| **VPC** | vpc-07fb237e5b9e71a46 |

**Routes:**
| Destination | Target | Status | Description |
|-------------|--------|--------|-------------|
| 10.0.0.0/16 | local | Active | Local VPC traffic |
| 0.0.0.0/0 | nat-0ea1e7aa0e243691b | Active | Outbound via NAT GW AZ2 |

**Subnet Associations (2 subnets):**
- `project2-monolith-app-subnet-2` (10.0.12.0/24)
- `project2-monolith-db-subnet-2` (10.0.22.0/24)

---

## Traffic Flow Analysis

### Public Subnets
- Traffic to `10.0.0.0/16` stays local.
- Traffic to any other IP (`0.0.0.0/0`) goes to **Internet Gateway**.
- **Result:** Instances here (Bastion, ALB, Zabbix) can accept inbound internet traffic and send outbound responses.

### Private Subnets (AZ1)
- Traffic to `10.0.0.0/16` stays local.
- Traffic to Internet (`0.0.0.0/0`) goes to **NAT Gateway 1**.
- **Result:** Instances (App 1, DB 1) can initiate outbound requests (updates/patches) but CANNOT accept direct inbound connection from internet.

### Private Subnets (AZ2)
- Traffic to `10.0.0.0/16` stays local.
- Traffic to Internet (`0.0.0.0/0`) goes to **NAT Gateway 2**.
- **Result:** Instances (App 2, DB 2) can initiate outbound requests via their own AZ's NAT Gateway.

---

## Resilience Check

- **What if NAT Gateway 1 fails?**
  - Private instances in AZ1 lose outbound internet access.
  - Private instances in AZ2 **continue working normally** (using NAT GW 2).
  - **Conclusion:** Multi-AZ resilience is correctly configured.

---

## Validation Checklist ✅

### Public Route Table
- [x] Created: rtb-0836a359537138102
- [x] Route to IGW exists
- [x] Both Public subnets associated

### Private Route Table AZ1
- [x] Created: rtb-05574f8872cd0bd58
- [x] Route to NAT GW 1 exists
- [x] App Subnet 1 associated
- [x] DB Subnet 1 associated

### Private Route Table AZ2
- [x] Created: rtb-005363bec02a6b9ff
- [x] Route to NAT GW 2 exists
- [x] App Subnet 2 associated
- [x] DB Subnet 2 associated

---

## Next Step: TASK 2.1 Security Groups

We have the "pipes" (networking) connected. Now we need the "gates" (firewalls).

We will create 6 Security Groups:
1. **ALB SG** (Public HTTP/HTTPS)
2. **Bastion SG** (SSH from your IP)
3. **Web Tier SG** (HTTP from ALB + SSH from Bastion)
4. **App Tier SG** (Traffic from Web + SSH from Bastion)
5. **DB Tier SG** (MySQL from App + Bastion)
6. **Zabbix SG** (Monitoring traffic)

**Estimated Time:** 20-30 minutes

