module "dynamo" {
    source = "./modmain"

name           = "dynamodules"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"
  name1= "LockID"

  }