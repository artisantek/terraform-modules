provider "aws" {
  region = var.region
}

resource "aws_dynamodb_table" "table" {
  name           = var.name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.tags
}
