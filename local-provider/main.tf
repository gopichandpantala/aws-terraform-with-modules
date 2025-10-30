terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "simple_file" {
  filename = "hello.txt"
  content  = "This file was created by Terraform without using variables."
}

