variable "region" {
  description = "AWS Region"
  type = string
  default = "ap-sout-1"
}

variable "table_name" {
    description = "Name of the Dynamo DB table"
    type = string  
}

variable "hash_key" {
    description = "Name of the Hash key"
    type = string  
}

variable "read_capacity" {
  description = "DynamoDB Read capacity"
  type = number
}

variable "write_capacity" {
  description = "DynamoDB write capacity"
  type = number
}