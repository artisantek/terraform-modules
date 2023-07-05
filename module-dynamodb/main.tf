 provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA3D36VHA2AUBPFME3"
    secret_key = "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"
}
 
 
 resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "dynamodb-module"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  

  attribute {
    name = "LockID"
    type = "S"
  }
}