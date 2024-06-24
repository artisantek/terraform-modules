provider "aws" {
  region = "ap-south-1"
}

resource "aws_dynamodb_table" "terraform_s3_dynamodb" {
  name = var.name
  billing_mode = var.billing_mode
  read_capacity = 5
  write_capacity = 5
  hash_key = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }
}