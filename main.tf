resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "s3-versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
