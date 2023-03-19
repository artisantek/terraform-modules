module "dynamo" {
    source = "./Abhi DB"

name           = "Abhidynamo"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  Abhi1= "LockID"

  }