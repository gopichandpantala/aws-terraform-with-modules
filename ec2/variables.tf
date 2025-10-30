# AWS region where resources will be created
variable "aws_region" {
  description = "AWS region for EC2 deployment"
  type        = string
  default     = "ap-south-1"
}

# EC2 instance AMI ID
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-00af95fa354fdb788" # Amazon Linux 2023 in ap-south-1
}

# Instance type (t2.micro = free tier eligible)
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Key pair for SSH access (must exist in AWS)
variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
  default     = "AL2023" # replace with your key pair name
}

# Security group name
variable "security_group_name" {
  description = "Security group for EC2"
  type        = string
  default     = "ec2-sg"
}

# Tag name for EC2 instance
variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "Ec2-terraform"
}
