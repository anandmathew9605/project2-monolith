# Project Documentation: AWS Cloud-Native Snake Game
**Architecture:** 2-Tier VPC (Public Web Tier + Private Data Tier)
**Stack:** LAMP (Linux, Apache, MySQL, PHP) + AWS Secrets Manager
**Goal:** Host a classic Snake game with a persistent leaderboard stored in RDS, using IAM authentication for security.

---

## Phase 1: Infrastructure & Security Setup

### 1. Database (RDS)
* **Service:** Amazon RDS (MySQL)
* **Configuration:** Single AZ (for dev) or Multi-AZ (for prod).
* **Security Group:** Created a generic DB Security Group.

### 2. Secrets Management (AWS Secrets Manager)
* **Action:** Stored RDS credentials in Secrets Manager.
* **Secret Type:** "Credentials for Amazon RDS database".
* **Purpose:** To avoid hardcoding database passwords in the application source code.

### 3. Compute (EC2)
* **OS:** Ubuntu 22.04 / 24.04 LTS.
* **Network:** Launched in a Public Subnet with a Public IP.

### 4. Security Glue (Connecting EC2 to RDS)
* **RDS Security Group Inbound Rule:**
    * **Type:** MySQL/Aurora (Port 3306)
    * **Source:** The Security Group ID of your EC2 instance (e.g., `sg-01234abc`).
* **IAM Role (Identity):**
    * **Role Name:** `SnakeGameRole`
    * **Permissions:** `SecretsManagerReadWrite` (or a restricted `GetSecretValue` policy).
    * **Action:** Attached this role to the EC2 instance via **Actions > Security > Modify IAM Role**.

---

## Phase 2: Environment Configuration (Inside EC2)

### 1. Install System Dependencies (LAMP Stack)
Update the package manager and install Apache, PHP, and MySQL client tools.
```bash
sudo apt update
sudo apt install -y apache2 php libapache2-mod-php php-mysql php-xml php-curl unzip mysql-client
2. Install Composer & AWS SDK
Required for the PHP application to talk to AWS Secrets Manager.

Bash

# 1. Download Composer
curl -sS [https://getcomposer.org/installer](https://getcomposer.org/installer) | php

# 2. Move to global bin
sudo mv composer.phar /usr/local/bin/composer

# 3. Install AWS SDK in the web root
cd /var/www/html
sudo composer require aws/aws-sdk-php
3. File Permissions Setup
Ensure the default user (ubuntu) can edit files, and Apache (www-data) can read them.

Bash

sudo chown -R ubuntu:ubuntu /var/www/html
sudo chmod -R 755 /var/www/html
Phase 3: Database Initialization
1. Fetch Password (If manual entry is needed)
Since we didn't memorize the password, we used a temporary PHP script to fetch it from Secrets Manager, or verified connection via the IAM role logic.

2. Create Database & Table
Connected to RDS and ran the SQL initialization.

SQL

-- Connect command: mysql -h <RDS_ENDPOINT> -u <USER> -p

CREATE DATABASE snake_game;
USE snake_game;

CREATE TABLE leaderboard (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50),
    score INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
Phase 4: Application Deployment
1. Clean Default Files
Removed the default Apache landing page.

Bash

rm /var/www/html/index.html
2. Deploy Frontend Code
Created the following files in /var/www/html/:

index.html (The game interface)

style.css (The Windows 95 styling)

game.js (The game logic and fetch API calls)

3. Deploy Backend API
Created the API directory and PHP scripts in /var/www/html/api/:

api/db_connect.php: Handles AWS Secrets Manager fetching and DB connection.

api/get_scores.php: Returns top 8 scores as JSON.

api/submit_score.php: Inserts new high scores.

Note: We modified get_scores.php to use LIMIT 8 to fit the retro UI design.

4. Final Permission Fix
Ensured Apache has full ownership of the production files.

Bash

sudo chown -R www-data:www-data /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;
Phase 5: Hardening & Artifact Creation (The "Golden Image")
1. Cleanup
Removed temporary testing scripts to prevent security leaks.

Bash

sudo rm /var/www/html/db_setup.php
sudo rm /var/www/html/show_pass.php
2. Enable Auto-Start
Ensured the web server starts automatically if the instance reboots.

Bash

sudo systemctl enable apache2
sudo systemctl restart apache2
3. Create AMI (Baking)
Console: EC2 > Image and templates > Create image.

Setting: Checked "Reboot instance" to ensure data consistency.

Result: SnakeGame-Golden-Image-v1

4. Create Launch Template (For Auto-Scaling)
Since AMIs do not save IAM Roles, we created a Launch Template.

Template Name: SnakeGame-Template-v1

Source AMI: SnakeGame-Golden-Image-v1

IAM Instance Profile: SnakeGameRole

Usage: Allows launching new game servers that automatically have permission to read the database password.

Verification
URL: http://<Public-IP>/ loads the game.

Backend: Leaderboard loads data from RDS successfully.

Security: No credentials exist in the source code; they are fetched securely at runtime.