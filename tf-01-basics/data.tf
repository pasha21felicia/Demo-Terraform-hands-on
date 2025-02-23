# 🔹 Fetch AWS account details dynamically
data "aws_caller_identity" "current" {}

# 🔹 Fetch the current AWS region dynamically
data "aws_region" "current" {}

# Usage example : subnet_id = data.aws_subnet.mysubnet.id
data "aws_subnet" "mysubnet" {
  filter {
    name   = "subnet-id"
    values = ["subnet-07d076ec27e6ee94b"] # Replace with your actual Subnet ID
  }
}
