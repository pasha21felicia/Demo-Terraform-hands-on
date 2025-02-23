module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "s3-bucket-from-module"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

# 🔹 Call the VPC Module
module "custom_vpc" {
  source          = "./modules/custom_vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}
# 🔹 Call the EC2 Module
module "custom_ec2" {
  source        = "./modules/custom_ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.custom_vpc.private_subnet_id
  vpc_id = module.custom_vpc.vpc_id
  instance_name = var.instance_name
  allowed_ip    = var.allowed_ip
}
