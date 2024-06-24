variable "name" {
  type = string
  default = "dynamodb_terraform_backend"
}

variable "billing_mode" {
  type = string
  default = "PROVISIONED"
}

variable "hash_key" {
  type = string
  default = "LockID"
}