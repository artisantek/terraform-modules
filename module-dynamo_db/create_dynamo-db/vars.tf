variable "name" {
    default = "dynamodb-terraform-module"  
}

variable "billing_mode" {
    default = "PROVISIONED"
  
}

variable "read_capacity" {
    default = "20"
  
}

variable "write_capacity" {
   default = "20"
}