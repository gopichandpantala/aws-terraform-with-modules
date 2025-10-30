# AWS Region
variable "aws_region" {
  description = "AWS region where DynamoDB table will be created"
  type        = string
  default     = "ap-south-1"
}


variable "table_name" {
  default     = "terraform-lock-table-gopi"
  description = "Name of the DynamoDB table"
  type        = string
}
