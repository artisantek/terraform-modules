provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "module_s3" {
  bucket = "my-first-module-s3"

  tags = {
    Name = "terraform_s3"
  }
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.module_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}