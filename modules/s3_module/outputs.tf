output "arn" {
  description = "ARN of the s3 bucket"
  value       = aws_s3_bucket.mys3_bucket.arn
}
output "name" {
  description = "The name (id) of s3 bucket"
  value       = aws_s3_bucket.mys3_bucket.id
}
/*
output "domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket.mys3_bucket.website_domain 
}*/
output "endpoint" {
  description = "Endpoint information of the bucket"
  value       = aws_s3_bucket.mys3_bucket.website_endpoint
}