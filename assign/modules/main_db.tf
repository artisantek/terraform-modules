provider "aws" {
  region = "us-east-1"
}

module "dynamodb" {
  source = "./module/dynamodb"
}