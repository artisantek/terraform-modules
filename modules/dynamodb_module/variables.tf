variable "region" {
  description = "The AWS region where the DynamoDB table will be created."
  type        = string
}

variable "table_name" {
  description = "The name of the DynamoDB table."
  type        = string
}

variable "billing_mode" {
  description = "The billing mode for the DynamoDB table."
  type        = string
  default     = "PROVISIONED"  # Other options: "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "The attribute name used as the hash (partition) key for the DynamoDB table."
  type        = string
}

variable "read_capacity" {
  description = "The read capacity units for the DynamoDB table in provisioned mode."
  type        = number
  default     = 5  # Adjust as needed
}

variable "write_capacity" {
  description = "The write capacity units for the DynamoDB table in provisioned mode."
  type        = number
  default     = 5  # Adjust as needed
}
