provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

# Resource definition for the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy
  
}

resource "aws_s3_bucket_versioning" "s3-terra" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration {
      status = var.versioning

    }
}
