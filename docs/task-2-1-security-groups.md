# TASK 2.1: Security Groups Configuration

**Date Completed:** December 01, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully created 6 Security Groups forming a **stateful firewall perimeter** for the 3-tier architecture.
- **Public-facing groups** (ALB, Bastion) allow specific inbound traffic.
- **Private-facing groups** (Web, App, DB) only allow traffic from upstream tiers.
- **Management groups** (Zabbix, Bastion) provide operational access.

---

## Security Groups Detail

### 1. Public-Facing Groups

| Name | ID | Description | Inbound Rules |
|------|----|-------------|---------------|
| **ALB SG** | sg-0d313acfea76eefcc | Public Web Traffic | HTTP (80) from 0.0.0.0/0<br>HTTPS (443) from 0.0.0.0/0 |
| **Bastion SG** | sg-00ee03de8559eaec9 | SSH Jump Host | SSH (22) from **49.37.232.176/32** (Your IP) |

### 2. Management Groups

| Name | ID | Description | Inbound Rules |
|------|----|-------------|---------------|
| **Zabbix SG** | sg-0d59931f3a8dfd2e9 | Monitoring Server | HTTPS (443) from 0.0.0.0/0 (Web UI)<br>SSH (22) from Bastion SG |

### 3. Private Application Tiers

| Name | ID | Description | Inbound Rules |
|------|----|-------------|---------------|
| **Web SG** | sg-0026c3feec4cf0e77 | Apache/Frontend | HTTP (80) from **ALB SG**<br>SSH (22) from **Bastion SG**<br>TCP (10050) from **Zabbix SG** |
| **App SG** | sg-0fef92868d4536eed | PHP-FPM/Backend | TCP (9000) from **Web SG**<br>SSH (22) from **Bastion SG**<br>TCP (10050) from **Zabbix SG** |
| **DB SG** | sg-09c26b84e667abfc1 | RDS MySQL | MySQL (3306) from **App SG**<br>MySQL (3306) from **Bastion SG** |

---

## Traffic Flow Validation

### 1. Web Traffic Path
```
User (Internet) -> [ALB SG] -> [Web SG] -> [App SG] -> [DB SG]
(Allowed)         (Allowed)   (Allowed)    (Allowed)    (Allowed)
```

### 2. Management Access Path
```
Admin (Your IP) -> [Bastion SG] -> [Web/App/DB SG]
(Allowed)         (SSH Tunnel)    (SSH/MySQL Allowed)
```

### 3. Monitoring Path
```
Zabbix Server -> [Web/App SG]
(Zabbix Agent Port 10050 Allowed)
```

---

## Validation Checklist ✅

- [x] All 6 Security Groups created
- [x] Names follow convention `project2-monolith-*-sg`
- [x] Bastion SG locked to specific IP (`49.37.232.176/32`)
- [x] Web SG accepts traffic ONLY from ALB SG (not internet)
- [x] App SG accepts traffic ONLY from Web SG
- [x] DB SG accepts traffic ONLY from App SG + Bastion
- [x] Zabbix SG setup for monitoring

---

## Next Steps (TASK 3.1)

**Launch Bastion Host**
- Launch t3.micro instance in **Public Subnet AZ1**
- Attach **Bastion SG**
- Test SSH connectivity from your local machine

**Estimated Time:** 15-20 minutes

