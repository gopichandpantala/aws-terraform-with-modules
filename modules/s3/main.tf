# Create an S3 bucket for Terraform backend or general use
resource "aws_s3_bucket" "terraform_bucket" {
  bucket        = "${var.environment}-${var.bucket_name}"
  force_destroy = true

  tags = {
    Name        = "${var.environment}-${var.bucket_name}"
    Environment = var.environment
    Purpose     = "Terraform state and storage"
  }
}

# Enable versioning for S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access to bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.terraform_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
