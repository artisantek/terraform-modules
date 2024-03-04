resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket-name

  tags = {
    Name = "s3-bucket-test"
  }
  force_destroy = true
}
