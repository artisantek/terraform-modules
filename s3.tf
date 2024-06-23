resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name = var.bucket_name
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, uat, prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}
