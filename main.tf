provider "aws" {
  region = "ap-south-1"
}

module "aws_s3_bucket" {
  source = "./s3"
  bucket = var.bucket
}

module "aws_dynamodb_table" {
  source = "./dynamoDB"
  name = var.name
  billing_mode = var.billing_mode
  hash_key = var.hash_key
}
