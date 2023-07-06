provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "bucket" {
  bucket = "s3modulebucket"
  tags = {
    Name  = "terraform-backend-s3-bucket"
  }
}
resource "aws_s3_bucket_versioning" "teraform-versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}