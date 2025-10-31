variable "aws_region" {
  description = "AWS region where DynamoDB table will be created"
  type        = string
  default     = "ap-south-1"
}

variable "table_name" {
  description = "Base name of the DynamoDB table (environment prefix will be added)"
  type        = string
  default     = "terraform-lock-table-gopi"
}

variable "environment" {
  description = "Environment name (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}
