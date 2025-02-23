## Module Overview 📘

### Example 1: Dynamic Resource Provisoning `dynamic_sg.tf`
This example demonstrates dynamically creating security group rules based on input lists. This approach allows you to easily scale and modify the rules by changing a single list.
Dynamic Block (ingress): The dynamic block allows you to generate the ingress rules dynamically based on the allowed_ports variable. 
Each port in the list creates a new ingress rule.

### Example 2: Dynamic Resource Provisoning `multiple_ec2.tf`
This example dynamically creates EC2 instances with different instance types and AMIs based on input variables.
**for_each:** The EC2 instances are created dynamically based on the instances map variable. Each entry in the map corresponds to an instance, and the attributes like ami_id and instance_type are set dynamically.

### Example 3: Advanced Module of VPC and looping `vpc.tf`
Uses **List Comprehension: **The public_subnets and private_subnets are each a list of CIDR blocks for subnets in different AZs, with the public and private subnets having different IP address ranges.
The cidrsubnet function is used to create smaller subnet CIDR blocks within the given VPC CIDR block (10.1.0.0/20), and the k index determines the starting address for each subnet. The +10 offset for private subnets ensures that they are allocated from a different address range than the public ones.
```hcl
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 10)]
```

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

6. **Destroy Configuration**

```bash
terraform destroy --auto-approve
```
