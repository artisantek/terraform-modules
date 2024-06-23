provider "aws" {
  region = "ap-south-2"
}
resource "aws_s3_bucket" "s3"{
  bucket = "nithi-bucket-1111"
  force_destroy = true
tags = {
  Name = "My_Buckets"
 }
 
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
bucket = aws_s3_bucket.s3.id
versioning_configuration {
status = "Enabled"
 }
}

