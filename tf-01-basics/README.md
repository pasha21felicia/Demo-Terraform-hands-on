# Terraform S3 Bucket with Versioning and ACL

## 📌 Overview
This Terraform configuration creates an **Amazon EC2 in the default VPC** and **Amazon S3 bucket** with:
- **Bucket Ownership Controls** (`BucketOwnerPreferred`)
- **Private ACL**
- **Versioning Enabled**

#### Region of work - eu-central-1

## 🏗️ Project Structure
```
tf-01-basics/
│── main.tf
│── data.tf
│── variables.tf
│── outputs.tf
│── terraform.tfvars
│── providers.tf
```

## 🚀 Getting Started

### 📌 1️. Prerequisites
Ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS credentials configured and enabled on the current Terminal


## 📌 2️. Set Up the Terraform Project

#### **Open the Repository**
```sh
cd tf-01-basics
```
## 📌 3. Configure AWS credentials:

Open a terminal window (CMD + Space and type 'Terminal') or open a new terminal in your favourite IDE (eg. Visual Studio Code).

In VS Code -> Open folder `tf-01-basics -> New Terminal`

Go to your Isengard account and copy the bash/zsh temporary credentials from your account:

Provide:

```sh
export ISENGARD_PRODUCTION_ACCOUNT=false
export AWS_ACCESS_KEY_ID=<your-aws-access-key>
export AWS_SECRET_ACCESS_KEY=<your-aws-secret-key>
export AWS_SESSION_TOKEN=<your-session-token>
```

Now you have an active session to AWS account for 1h, anytime it expires, make sure to copy the credentials into the terminal again.

## 📌 4. Find the one Subnet ID of the default VPC 
In `data.tf` add for "aws_subnet" "mysubnet" the Subnet ID of your own default VPC (check in the AWS Console)

```hcl
data "aws_subnet" "mysubnet" {
  filter {
    name   = "subnet-id"
    values = ["subnet-07d076ec27e6ee94b"] # Replace with your actual Subnet ID
  }
}
```
## 📌 5. Run Terraform Commands
#### **Initialize Terraform**
```sh
terraform init
```
#### **Format and Validate Configuration**
```sh
terraform fmt
terraform validate
```

#### **Plan Deployment**
```sh
terraform plan
```

#### **Apply the Configuration**
```sh
terraform apply -auto-approve
```


## 📌 6️. Destroy the Deployment

To delete all resources created:
```sh
terraform destroy -auto-approve
```

---

## 📌 7️. Notes
- In `data.tf` the "aws_subnet" "mysubnet" is imported from one of public subnets available in your accounts default VPC
- Amazon EC2 is deployed in the default VPC
- The **ACL is private**, so the bucket is not publicly accessible.
- Versioning is **enabled** to keep previous versions of objects.

---

## 🎯 Conclusion
You have successfully deployed an **AWS S3 bucket** with **versioning and private ACL** using Terraform and you learned to import data for resources! 🚀
