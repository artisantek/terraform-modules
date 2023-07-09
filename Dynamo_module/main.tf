resource "aws_dynamodb_global_table" "Terraform-DynamoDB" {
  name = var.name
  billing_mode = var.billing_mode
  read_capacity = var.read_capacity
  write_capacity = var.write_capacity
  hash_key  =   var.hash_key

  attribute {
    name = "LockID"
    type = "S"
  }
}
