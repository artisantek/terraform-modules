provider "aws" {
    region = "ap-south-1" 
}

resource "aws_s3_bucket" "Terraform-s3-bucket" {
  bucket = "terraform-121-backend-test"
  force_destroy = true

  tags = {
    Name        = "My-terra-bucket"
  }
}

resource "aws_s3_bucket_versioning" "Terraform-s3-versioning" {
  bucket = aws_s3_bucket.Terraform-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}