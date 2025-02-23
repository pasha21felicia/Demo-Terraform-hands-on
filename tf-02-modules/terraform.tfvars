aws_region     = "eu-central-1"
vpc_name       = "custom-vpc-module"
vpc_cidr       = "10.0.0.0/16"
azs            = ["eu-central-1a", "eu-central-1b"]
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

instance_name  = "PublicEC2Instance"
ami_id         = "ami-0abcdef1234567890"
instance_type  = "t2.micro"
allowed_ip     = "203.0.113.25/32"
