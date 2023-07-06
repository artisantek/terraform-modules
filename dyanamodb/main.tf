resource "aws_dynamodb_table" "dyanamo-db" {
  name           = "db-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }
}