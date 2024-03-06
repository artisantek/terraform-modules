provider "aws" {
  region = "ap-south-1"
}

module "Terraform-s3-bucket" {
  source = "./module/s3"
}

module "aws_s3_bucket_versioning" {
    source = "./module/s3"
}


module "Terraform-dynamodb" {
  source = "./module/dynamoDB"
}