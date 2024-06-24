provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_s3" {
  bucket = var.bucket
  force_destroy = true
  tags = {
    Name = "terraform_s3"
  }
}
