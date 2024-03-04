provider "aws" {
    region = var.region
}
resource "aws_s3_bucket" "this" {
  bucket_prefix = var.bucket_prefix
  tags = var.tags
}
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}