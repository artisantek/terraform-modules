resource "aws_s3_bucket" "modules3" {
  bucket = "modules3"
  acl    = "private"
  tags = {
    Name = "Module-S3"
  }
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.modules3.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
