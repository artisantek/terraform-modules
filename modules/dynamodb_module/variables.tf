variable "name" {
  description = "Name of the table"
  type        = string
  default     = "mydynamodb-table"
}
variable "billing_mode" {
  description = "Billing mode for DynamoDB table"
  type        = string
  default     = "PROVISIONED"
}
variable "read_capacity" {
  description = "Read capacity for DynamoDB table"
  type        = number
  default     = 5
}
variable "write_capacity" {
  description = "Write capacity for DynamoDB table"
  type        = number
  default     = 5
}
variable "hash_key" {
  description = "Partision key for DynamoDB table"
  type        = string
  default     = "LockID"
}
variable "range_key" {
  description = "Sort key for the table"
  type        = string
  default     = "Size"
}
