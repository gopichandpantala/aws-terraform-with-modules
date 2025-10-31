variable "aws_region" {
  description = "AWS region for EC2 deployment"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}

variable "security_group_name" {
  description = "Security group name for EC2"
  type        = string
  default     = "ec2-sg"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "Ec2-terraform"
}

variable "vpc_id" {
  description = "VPC ID where the EC2 instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}
