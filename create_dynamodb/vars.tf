variable "region" {
  type = string
  description = "region of dynamodb table"
  default = ""
}
variable "name" {
  type = string
  description = "name of dynamodb table"
  default = ""
}
variable "billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "The number of read units for this table"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The number of write units for this table"
  type        = number
  default     = 5
}
variable "tags" {
  description = "A mapping of tags to assign to the table"
  type        = map(string)
  default     = {}
}