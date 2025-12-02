# TASK 5.1: RDS MySQL Database Configuration

**Date Completed:** December 02, 2025  
**Region:** ap-south-1 (Mumbai)  
**Status:** ✅ COMPLETED

---

## Executive Summary

Successfully provisioned a **MySQL RDS Database** in private DB subnets with AWS Secrets Manager integration.
- Database deployed with Multi-AZ or Single-AZ configuration for high availability.
- Credentials managed securely via AWS Secrets Manager with KMS encryption.
- Connectivity validated from Bastion host.
- Database isolated in private subnets with no public access.

---

## RDS Instance Details

| Property | Value |
|----------|-------|
| **DB Instance Identifier** | project2-monolith-db |
| **Endpoint** | project2-monolith-db.cjq40ma4q744.ap-south-1.rds.amazonaws.com |
| **Port** | 3306 |
| **Engine** | MySQL 8.0.x |
| **DB Instance Class** | db.t3.micro |
| **Storage Type** | General Purpose SSD (gp3) |
| **Allocated Storage** | 20 GiB |
| **Master Username** | admin |
| **Initial Database Name** | monolithdb |
| **VPC** | project2-monolith-vpc |
| **DB Subnet Group** | project2-monolith-db-subnet-group |
| **Availability Zone** | ap-south-1a (primary) |
| **Multi-AZ** | Enabled/Disabled (confirm based on your selection) |
| **Public Access** | No ✅ |
| **Backup Retention** | 7 days |
| **Deletion Protection** | Disabled (for testing/cost control) |

---

## DB Subnet Group

| Property | Value |
|----------|-------|
| **Name** | project2-monolith-db-subnet-group |
| **Description** | DB subnet group for MySQL in private subnets |
| **VPC** | project2-monolith-vpc |
| **Subnets** | project2-monolith-db-subnet-1 (10.0.21.0/24, ap-south-1a)<br>project2-monolith-db-subnet-2 (10.0.22.0/24, ap-south-1b) |

---

## Security & Secrets Management

### AWS Secrets Manager Integration

| Property | Value |
|----------|-------|
| **Secret Name** | rds!db-f74d77c4-e1fc-4c6f-a1c5-186320d65edb |
| **Secret Type** | RDS database credentials |
| **Encryption** | AWS KMS (Customer managed key) |
| **KMS Key Alias** | project2-monolith-db-key |
| **Rotation** | Disabled (can be enabled later) |

**Password managed automatically by RDS through Secrets Manager lifecycle.**

### Retrieve Password Programmatically

```bash
# From Bastion or any EC2 with IAM permissions
SECRET_NAME='rds!db-f74d77c4-e1fc-4c6f-a1c5-186320d65edb'

DB_PASSWORD=$(aws secretsmanager get-secret-value \
  --secret-id "$SECRET_NAME" \
  --region ap-south-1 \
  --query 'SecretString' \
  --output text | jq -r '.password')
```

---

## Security Group Configuration

**Security Group:** `project2-monolith-db-sg`

**Inbound Rules:**
- MySQL/Aurora (TCP 3306) from `project2-monolith-app-sg` (App instances)
- MySQL/Aurora (TCP 3306) from `project2-monolith-bastion-sg` (Bastion for admin access)

**Outbound Rules:**
- All traffic to 0.0.0.0/0

This ensures the database only accepts connections from application instances and the Bastion host.

---

## Connectivity Testing

### Test from Bastion Host

```bash
# SSH to Bastion
ssh -i project2-monolith-key.pem ubuntu@43.205.240.36

# Install MySQL client
sudo apt-get update
sudo apt-get install -y mysql-client awscli jq

# Set variables
SECRET_NAME='rds!db-f74d77c4-e1fc-4c6f-a1c5-186320d65edb'
DB_ENDPOINT="project2-monolith-db.cjq40ma4q744.ap-south-1.rds.amazonaws.com"

# Retrieve password
DB_PASSWORD=$(aws secretsmanager get-secret-value \
  --secret-id "$SECRET_NAME" \
  --region ap-south-1 \
  --query 'SecretString' \
  --output text | jq -r '.password')

# Connect to database
mysql -h $DB_ENDPOINT -u admin -p"$DB_PASSWORD"
```

### Test Results ✅

```sql
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| monolithdb         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

mysql> USE monolithdb;
Database changed

mysql> SHOW TABLES;
Empty set (0.00 sec)
```

**Connection successful!** Database is ready for application integration.

---

## Connection String for Application

**For Ansible playbooks and application configuration:**

```yaml
DB_HOST: project2-monolith-db.cjq40ma4q744.ap-south-1.rds.amazonaws.com
DB_PORT: 3306
DB_NAME: monolithdb
DB_USER: admin
DB_PASSWORD: (retrieved from Secrets Manager at runtime)
```

---

## Traffic Flow

```
Application Instance (Private App Subnet)
    ↓
Security Group: project2-monolith-app-sg
    ↓
RDS Endpoint: project2-monolith-db.cjq40ma4q744.ap-south-1.rds.amazonaws.com:3306
    ↓
Security Group: project2-monolith-db-sg (allows traffic from App SG)
    ↓
MySQL Database (Private DB Subnet - 10.0.21.0/24 or 10.0.22.0/24)
```

---

## Cost Estimate

| Component | Monthly Cost (USD) |
|-----------|-------------------|
| RDS db.t3.micro (Single-AZ) | ~$15 |
| RDS db.t3.micro (Multi-AZ) | ~$30 |
| Storage (20 GiB gp3) | ~$3 |
| Backup Storage (7 days) | Included |
| Secrets Manager | ~$0.50 |
| KMS Key | ~$1 |
| **Total (Single-AZ)** | **~$19.50/month** |
| **Total (Multi-AZ)** | **~$34.50/month** |

---

## Validation Checklist ✅

- [x] DB Subnet Group created with both private DB subnets
- [x] RDS MySQL instance created
- [x] Instance status: Available
- [x] Master credentials managed in AWS Secrets Manager
- [x] KMS encryption enabled for secret
- [x] Security Group attached (allows traffic from App SG and Bastion SG)
- [x] Public access disabled
- [x] Connection from Bastion successful
- [x] Database `monolithdb` accessible

---

## Next Steps

**TASK 6.0:** Terraform Migration - Convert all manual infrastructure to Infrastructure as Code

**Estimated Time:** 3-4 hours

