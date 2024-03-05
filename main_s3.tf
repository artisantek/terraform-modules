provider "aws" {
  region = "us-east-1"
}

module "module_s3" {
  source = "./module/s3"
}

module "aws_s3_bucket_versioning" {
  source = "./module/s3"
}