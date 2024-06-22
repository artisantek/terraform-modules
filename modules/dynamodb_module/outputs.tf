output "dynamodb_table_arn" {
  value = aws_dynamodb_table.mydynamodb_table.arn
}
output "dynamodb_table_id" {
  value = aws_dynamodb_table.mydynamodb_table.id
}
output "dynamodb_table_billing_mode" {
  value = aws_dynamodb_table.mydynamodb_table.billing_mode
}