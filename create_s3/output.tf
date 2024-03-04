output "bucket_region" {
  description = "The region of the bucket"
  value       = aws_s3_bucket.this.region
}
output "bucket_name" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.this.bucket_prefix
}
output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.this.arn
}
