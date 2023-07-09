resource "aws_s3_bucket" "module-s3" {
    bucket = var.bucket
    force_destroy = var.force_destroy
}

resource "aws_s3_bucket_versioning" "S3-versioning" {
    bucket = aws_s3_bucket.module-s3.id
    versioning_configuration {
    status = "Enabled"
  }
}
