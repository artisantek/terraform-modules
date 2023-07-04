provider "aws" {
    region = "us-east-1"
     access_key = "AKIA5YXB5XKARVEGYNXY"
    secret_key =  "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"
}
module "module-s3" {
    source = "./create-s3"  
    s3_bucket_name = "white-tub-module"
  
}
