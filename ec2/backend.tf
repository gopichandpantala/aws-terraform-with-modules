terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket-gopi"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table-gopi"
    encrypt        = true
  }
}
