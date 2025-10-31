variable "aws_region" {
  description = "AWS region where S3 bucket will be created"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Base name for the S3 bucket (environment prefix will be added)"
  type        = string
  default     = "terraform-bucket-gopi"
}

variable "environment" {
  description = "Environment name (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}
