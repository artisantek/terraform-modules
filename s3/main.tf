provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "module_s3"{
    bucket = "lokesh-j-bucket"
    force_destroy = true
   
    tags = {
      Name = "My_Buckets"
    }
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.module_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}
