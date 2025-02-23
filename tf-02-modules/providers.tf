provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      terraform = "yes"
      project   = "terraform-demo"
    }
  }
}

terraform {
  required_version = ">= 1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
  # backend "s3" {
  #   bucket         = "demo-tfstate-not-delete"
  #   key            = "modules/terraform.tfstate"
  #   region         = "eu-central-1"
  #   encrypt        = true
  # }
}
