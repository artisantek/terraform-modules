variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "The billing mode of the DynamoDB table"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "The number of read capacity units for the DynamoDB table"
  type        = number
  default     = 20
}

variable "write_capacity" {
  description = "The number of write capacity units for the DynamoDB table"
  type        = number
  default     = 20
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key"
  type        = string
  default     = "LockID"
}

