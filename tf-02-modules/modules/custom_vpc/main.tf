locals {
  tags = {
    Name  = var.vpc_name
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name             = var.vpc_name
  cidr             = var.vpc_cidr
  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  enable_nat_gateway = true
  single_nat_gateway = true

  private_subnet_tags = {"Name" = "Custom-Private-Subnet"}
  public_subnet_tags = {"Name" = "Custom-Public-Subnet"}
  private_route_table_tags = {"Name" = "Private-Custom-Route-Table"}
  public_route_table_tags = {"Name" = "Public-Custom-Route-Table"}
  igw_tags = {"Name" = "Custom-IGW"}
  nat_gateway_tags = {"Name" = "Custom-NAT-GTW"}
  tags = local.tags
}
