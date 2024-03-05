provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "dynamodb-1" {
  name           = "module_dynamodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
  }
}