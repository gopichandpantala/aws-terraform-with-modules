# AWS Region
variable "aws_region" {
  description = "AWS region for VPC deployment"
  type        = string
  default     = "ap-south-1"
}

# Environment (dev, stage, prod)
variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}

# CIDR blocks
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Availability zones
variable "availability_zone_public" {
  description = "AZ for public subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "availability_zone_private" {
  description = "AZ for private subnet"
  type        = string
  default     = "ap-south-1b"
}

# Project name
variable "project_name" {
  description = "Project name used in resource tags"
  type        = string
  default     = "vpc-project"
}
