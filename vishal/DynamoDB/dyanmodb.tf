provider "aws" {
  region = var.region
}
resource "aws_dynamodb_table" "terraform-dynamodb" {
  name           = "terraform-dynamobd-modules"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}