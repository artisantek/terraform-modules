provider "aws" {
    region = "ap-south-1"
}
module "s3_bucket" {
    source = "./create_s3"
    bucket_prefix = "assign4a-581"
    tags = {
        Environment = "test"
        Owner = "QA team"
    }
}
module "dynamodb" {
    source = "./create_dynamodb"
    name = "assign4b-581"
    tags = {
       Name = "assign4b"
       Environment = "QA"
    }      
}