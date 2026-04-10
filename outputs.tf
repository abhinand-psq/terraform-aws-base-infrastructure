#output.tf

output "ec2_id" {
  value       = aws_instance.ec2_name.id
  description = "EC2 instance ID"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.abhinand.bucket
  description = "S3 bucket name"
}

