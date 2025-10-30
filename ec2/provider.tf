terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # AWS provider version
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region # region defined in variables.tf
}
