variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket."
}

variable "bucket_acl" {
  type        = string
  description = "The ACL (access control list) for the S3 bucket."
  default     = "private"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Production"
  }
}