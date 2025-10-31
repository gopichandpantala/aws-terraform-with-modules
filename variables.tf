# Common
variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

# VPC
variable "vpc_cidr" { type = string }
variable "public_subnet_cidr" { type = string }
variable "private_subnet_cidr" { type = string }
variable "availability_zone_public" { type = string }
variable "availability_zone_private" { type = string }

# S3
variable "bucket_name" { type = string }

# EC2
variable "instance_type" { type = string }
variable "ami_id" { type = string }
variable "key_name" { type = string }

# DynamoDB
variable "dynamodb_table_name" { type = string }
