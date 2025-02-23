output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.bucket_simple.id
}
output "instance_id" {
  description = "The ID of the deployed EC2 instance"
  value       = aws_instance.simple_ec2.id
}
