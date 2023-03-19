module "dynamo" {
    source = "./modules"

name           = "ummidynmob"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  ummi1= "LockID"

  }