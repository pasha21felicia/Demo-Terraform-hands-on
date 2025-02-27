provider "aws" {
  region = "eu-central-1"

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
}
