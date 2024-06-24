output "aws_bucket_id" {
  value = module.aws_s3_bucket
}

output "table_id" {
  value = module.aws_dynamodb_table
}