provider "aws" {
  region = "ap-south-1"
}

module "module_s3" {
  source = "./modules/S3-module-rohith"
  bucket = var.bucket
  force_destroy = var.force_destroy
}

