resource "aws_s3_bucket" "mys3_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.decision
  tags          = var.tags
}
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.mys3_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.mys3_bucket.id
  depends_on = [aws_s3_bucket_public_access_block.disable_block_access]
  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "PublicRead",
                "Effect": "Allow",
                "Action": ["s3:GetObject"],
                "Principal": "*",
                "Resource": ["arn:aws:s3:::${var.bucket_name}/*"] 
            }
        ]
    }
    EOF
}
resource "aws_s3_bucket_public_access_block" "disable_block_access" {
  bucket = aws_s3_bucket.mys3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}