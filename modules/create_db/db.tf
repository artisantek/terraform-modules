provider "aws" {
  region = var.region
}

module "dynamodb_table" {
    source = "git::https://github.com/Abhilash-HJ/terraform-modules.git//modules/create-db"
    table_name = "Terraform-DBtable"
    hash_key = "id"
    read_capacity = 5
     write_capacity = 5
}