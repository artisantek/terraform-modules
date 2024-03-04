provider "aws" {
  region = "ap-south-1"
}
resource "aws_dynamodb_table" "dynamodb-table-test" {

  billing_mode                = "PROVISIONED"
  deletion_protection_enabled = false
  hash_key                    = var.hashkey-name
  name                        = var.dynamodb-name
  range_key                   = var.rangekey-name
  read_capacity               = 3
  stream_enabled              = false
  tags                        = {}
  tags_all                    = {}
  write_capacity              = 3
  attribute {
    name = "first-name"
    type = "S"
  }
  attribute {
    name = "last-name"
    type = "S"
  }
}
