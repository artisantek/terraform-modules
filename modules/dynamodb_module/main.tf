resource "aws_dynamodb_table" "mydynamodb_table" {
  name           = var.name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  attribute {
    name = var.hash_key
    type = "S"
  }
   attribute {
    name = var.range_key
    type = "S"
  }
  hash_key       = var.hash_key
  range_key      = var.range_key
  tags = {
    environment = "DEV"
    terraform = true
  }
}