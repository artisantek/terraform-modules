provider "aws" {
  region = "ap-south-1"
}

module "s3" {
    source = "./s3_module"

    bucket = "s3-bucket-4646"
}
