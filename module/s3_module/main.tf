resource "aws_s3_bucket" "s3" {
  bucket        = var.bucket_name
  force_destroy = true
  tags          = var.tag
}
