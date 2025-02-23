data "aws_availability_zones" "available" {}

locals {
  name   = basename(path.cwd)
  region = "eu-central-1"

  vpc_cidr = "10.1.0.0/20"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  #  List Comprehension: 
  # The public_subnets and private_subnets are each a list of CIDR blocks
  # for subnets in different AZs, with the public and private subnets having 
  # different IP address ranges.
  # The cidrsubnet function is used to create smaller subnet CIDR blocks within 
  # the given VPC CIDR block (10.1.0.0/20), and the k index determines the 
  # starting address for each subnet. The +10 offset for private subnets ensures 
  # that they are allocated from a different address range than the public ones.

  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 10)]

  enable_nat_gateway = true
  single_nat_gateway = true

  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${local.name}-default" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${local.name}-default" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${local.name}-default" }

}