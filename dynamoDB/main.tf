provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "dynamoDB" {
  name           = "DynamoDB-Module"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
}

    tags = {
        Name = "DynamoDB-table-module"
    }

}
