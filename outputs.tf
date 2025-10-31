output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "public_subnet_id" {
  value       = module.vpc.public_subnet_id
  description = "Public Subnet ID"
}

output "s3_bucket_name" {
  value       = module.s3.bucket_name
  description = "S3 bucket name"
}

output "ec2_instance_id" {
  value       = module.ec2.instance_id
  description = "EC2 instance ID"
}

output "dynamodb_table_name" {
  value       = module.dynamodb.table_name
  description = "DynamoDB table name"
}
