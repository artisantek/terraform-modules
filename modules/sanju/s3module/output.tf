output "s3_bucket_id" {
    value = aws_s3_bucket.module-s3.id  
}

output "s3_bucket_arn" {
    value = aws_s3_bucket.module-s3.arn
  
}

output "s3_bucket_region" {
    value = aws_s3_bucket.module-s3.region
  
}
