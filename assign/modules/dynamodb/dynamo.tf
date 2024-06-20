provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "dynamodb" {
  name           = "module_dynamo"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
}

    tags = {
        Name = "dynamodb-table"
    }

}