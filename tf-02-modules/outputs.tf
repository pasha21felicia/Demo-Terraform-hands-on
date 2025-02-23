output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.custom_vpc.vpc_id
}

output "instance_id" {
  description = "The ID of the deployed EC2 instance"
  value       = module.custom_ec2.instance_id
}

