# Create DynamoDB Table for Terraform State Locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "${var.environment}-${var.table_name}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.environment}-${var.table_name}"
    Environment = var.environment
    Purpose     = "Terraform State Locking"
  }
}
