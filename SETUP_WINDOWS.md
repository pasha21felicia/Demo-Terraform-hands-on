# Terraform Setup Guide for Windows

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation and Setup](#installation-and-setup)
  - [Step 0: Install VS Code](#step-0-install-vs-code)
  - [Step 1: Install Package Manager (Chocolatey)](#step-1-install-package-manager)
  - [Step 2: Install AWS CLI](#step-2-install-aws-cli)
  - [Step 3: Install Terraform](#step-3-install-terraform)
  - [Step 4: Install tfenv for Windows](#step-4-install-tfenv-for-windows)
  - [Step 5: Install HashiCorp Terraform Extension for VS Code](#step-5-install-the-hashicorp-terraform-extension-for-vs-code)
  - [Step 6: Set Up Command Aliases](#step-6-set-up-command-aliases)

---

## Prerequisites

Ensure you have the following:
- Administrative access to your Windows machine
- VS Code
- PowerShell or Windows Terminal
- Internet connection

---

## Step 1: Install Package Manager (Chocolatey)

Open PowerShell as Administrator and run:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Verify installation:
```powershell
choco --version
```

## Step 2: Install AWS CLI

```powershell
choco install awscli -y
```

Verify installation:
```powershell
aws --version
```

## Step 3: Install Terraform

```powershell
choco install terraform -y
```

Verify installation:
```powershell
terraform --version
```

## Step 4: Install the HashiCorp Terraform Extension for VS Code

1. Open VS Code
2. Press `Ctrl+Shift+X`
3. Search for "HashiCorp Terraform"
4. Click Install
5. Restart VS Code if prompted

## Step 5: Set Up Command Aliases

Create a PowerShell profile if you don't have one:

```powershell
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
```

Add aliases to your PowerShell profile:

```powershell
notepad $PROFILE
```

Add these lines:
```powershell
Set-Alias -Name tf -Value terraform
```

Reload your profile:
```powershell
. $PROFILE
```

# Working with Terraform Projects

## Step 6: Configure AWS Credentials

Open PowerShell and set your AWS credentials:

```powershell
$env:AWS_ACCESS_KEY_ID="your-access-key"
$env:AWS_SECRET_ACCESS_KEY="your-secret-key"
$env:AWS_SESSION_TOKEN="your-session-token"
```

For permanent storage, you can configure the AWS CLI:
```powershell
aws configure
```

## Step 7: Initialize and Deploy Resources

Create a new directory for your project:
```powershell
mkdir terraform-project
cd terraform-project
```

Create your Terraform configuration files:
```powershell
New-Item -Path "providers.tf" -ItemType File
New-Item -Path "main.tf" -ItemType File
```

Add this to `providers.tf`:
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Management = "Terraform"
    }
  }
}
```

Initialize and run Terraform:
```powershell
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Step 8: Destroy Resources (Optional)

```powershell
terraform destroy
```

## Important Windows-Specific Notes

1. If you encounter PATH issues, you may need to restart your terminal or computer after installations.
2. Always run PowerShell as Administrator when installing software.
3. If scripts are blocked, you might need to adjust execution policy:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Done!

You have successfully set up Terraform on your Windows machine and configured it for AWS usage!
