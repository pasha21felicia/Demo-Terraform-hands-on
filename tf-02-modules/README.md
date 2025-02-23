
## Module Overview 📘

1. **S3 Bucket Module (External)**  
   Uses the official AWS S3 module to create:
   - Private S3 bucket
   - Versioning enabled
   - Object ownership controls

2. **Custom VPC Module**  
   Creates:
   - VPC with custom CIDR block
   - Public and private subnets
   - Internet Gateway
   - Route tables

3. **Custom EC2 Module**  
   Provisions:
   - EC2 instances in private subnet
   - Security group configurations
   - Network access controls

## Getting Started 🚀

### Prerequisites
- AWS CLI installed
- Terraform installed (>= 1.0.0)
- AWS account with appropriate permissions

### Initial Setup

#### 1. **Clone and Navigate to Project**

```bash
cd tf-02-modules
```

#### 2. **Configure AWS Credentials**

Open a terminal window (CMD + Space and type 'Terminal') or open a new terminal in your favourite IDE (eg. Visual Studio Code).

In VS Code -> Open folder `tf-02-modules -> New Terminal`

Go to your Isengard account and copy the bash/zsh temporary credentials from your account:

Provide:

```sh
export ISENGARD_PRODUCTION_ACCOUNT=false
export AWS_ACCESS_KEY_ID=<your-aws-access-key>
export AWS_SECRET_ACCESS_KEY=<your-aws-secret-key>
export AWS_SESSION_TOKEN=<your-session-token>
```

Now you have an active session to AWS account for 1h, anytime it expires, make sure to copy the credentials into the terminal again.

#### 3. **Initialize Terraform**

```bash
terraform init
```

This will:
- Download required providers
- Initialize the S3 bucket module
- Set up your local environment

#### 4. **Review Configuration**

```bash
terraform plan
```

5. **Apply Configuration**

```bash
terraform apply
```

## Module Usage 💡

### Main Configuration

The `main.tf` file demonstrates how to use all modules:

```hcl
# S3 Bucket Module
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "XXXXXXXXXXXXXXXXXXXXX"
  acl    = "private"
  
  versioning = {
    enabled = true
  }
}

# VPC Module
module "custom_vpc" {
  source          = "./modules/custom_vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

# EC2 Module
module "custom_ec2" {
  source        = "./modules/custom_ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.custom_vpc.private_subnet_id
  vpc_id        = module.custom_vpc.vpc_id
  instance_name = var.instance_name
  allowed_ip    = var.allowed_ip
}
