resource "aws_s3_bucket" "s3-module" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_versioning" "s3-module" {
  bucket = aws_s3_bucket.s3-module.id
  versioning_configuration {
    status = var.versioning_status
  }
}

