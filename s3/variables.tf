# AWS Region
variable "aws_region" {
  description = "AWS region where DynamoDB table will be created"
  type        = string
  default     = "ap-south-1"
}


variable "bucket_name" {
  default     = "my-terraform-bucket-gopi"
  description = "Unique name for the S3 bucket"
  type        = string
}
