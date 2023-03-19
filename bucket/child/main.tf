provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "test-bucket-19-03"
  force_destroy = true
}


resource "aws_s3_bucket_versioning" "s3-versioning" {
  bucket = aws_s3_bucket.s3bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
