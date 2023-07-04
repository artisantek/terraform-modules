provider "aws" {
    region = "us-east-1"
     access_key = "AKIA5YXB5XKARVEGYNXY"
    secret_key =  "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"
}
module "module-dynamo_db" {
    source = "./create_dynamo-db"  
    name = "dynamodb-terraform-module"  
    billing_mode = "PROVISIONED"
    read_capacity = "20"
    write_capacity = "20"

}
  

