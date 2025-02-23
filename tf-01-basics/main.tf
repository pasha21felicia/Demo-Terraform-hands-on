# Examples of the resource configuration on these pages: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl

# 🔹 Define local variables
locals {
  full_bucket_name = "terraform-${var.bucket_name}-${data.aws_caller_identity.current.account_id}"
}

# 🔹 Create an S3 bucket
resource "aws_s3_bucket" "bucket_simple" {
  bucket = local.full_bucket_name
  tags = {
    Name        = "My simple demo bucket"
    Environment = "Dev"
  }
}

resource "aws_instance" "simple_ec2" {
  ami                         = var.ami_id
  subnet_id                   = data.aws_subnet.mysubnet.id
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
}


#######################################################################

# # 🔹 Set bucket ownership controls
# resource "aws_s3_bucket_ownership_controls" "bucket_simple_ownership" {
#   bucket = aws_s3_bucket.bucket_simple.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# # 🔹 Set bucket ACL (Access Control List)
# resource "aws_s3_bucket_acl" "bucket_simple_acl" {
#   depends_on = [aws_s3_bucket_ownership_controls.bucket_simple_ownership]

#   bucket = aws_s3_bucket.bucket_simple.id
#   acl    = "private"
# }

# # 🔹 Enable versioning for the S3 bucket
# resource "aws_s3_bucket_versioning" "bucket_simple_versioning" {
#   bucket = aws_s3_bucket.bucket_simple.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }


