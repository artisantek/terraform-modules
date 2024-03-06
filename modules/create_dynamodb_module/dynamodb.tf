provider "aws" {
  region = var.region
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  attribute {
    name = var.hash_key
    type = "S"  # Change the type according to your needs
  }
}

