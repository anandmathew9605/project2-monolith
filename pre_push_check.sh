#!/bin/bash

echo "=========================================="
echo "🔒 SECURITY CHECK BEFORE GIT PUSH"
echo "=========================================="

cd ~/Documents/personal/projects/project2-monolith

# Check 1: .gitignore exists
if [ -f .gitignore ]; then
    echo "✅ .gitignore file found"
else
    echo "❌ ERROR: .gitignore missing! Exiting."
    exit 1
fi

# Check 2: No .pem files staged
echo ""
echo "Checking for .pem files..."
if git status | grep -q "\.pem\|\.key"; then
    echo "❌ ERROR: .pem/.key files detected! Remove them first."
    git status | grep "\.pem\|\.key"
    exit 1
else
    echo "✅ No .pem/.key files will be committed"
fi

# Check 3: No .tfstate files staged
echo ""
echo "Checking for .tfstate files..."
if git status | grep -q "\.tfstate"; then
    echo "❌ ERROR: .tfstate files detected!"
    git status | grep "\.tfstate"
    exit 1
else
    echo "✅ No .tfstate files will be committed"
fi

# Check 4: No .env files
echo ""
echo "Checking for .env files..."
if git status | grep -q "\.env"; then
    echo "❌ ERROR: .env files detected!"
    git status | grep "\.env"
    exit 1
else
    echo "✅ No .env files will be committed"
fi

# All checks passed
echo ""
echo "=========================================="
echo "✅ ALL SECURITY CHECKS PASSED!"
echo "=========================================="
echo ""
echo "Proceeding with git add and status review..."
echo ""

git add .
git status

echo ""
echo "=========================================="
echo "READY TO COMMIT"
echo "=========================================="
echo ""
echo "To complete the push, run:"
echo ""
#echo "git commit -m \"PHASE 1 COMPLETE: Terraform infrastructure migration\n\n- 30 AWS resources imported to Terraform state\n- terraform plan shows 0 changes\n- Infrastructure reproducible via IaC\""
echo "git commit -m \"Terraform refactor\""
echo ""
echo "git push origin main"
