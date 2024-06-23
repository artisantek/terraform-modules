provider "aws" {
  region = "us-east-1"
}

module "dynamodb" {
  source = "./moduledynamoDB"
}
module "s3" {
  source = "./modules3"
}
