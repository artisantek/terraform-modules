provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "Terraform-s3" {
  bucket = "s3-bucket-terraform-modules-abhi"
  force_destroy = true
}