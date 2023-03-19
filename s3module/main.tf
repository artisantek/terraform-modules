resource "aws_s3_bucket" "backend-terraform" {
    bucket = var.bucket
    versioning {
        enabled = true
  }
  force_destroy = true
}