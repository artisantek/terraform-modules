variable "bucket" {
  description = "the name of the s3 bucket"
  type = string
  default = "s3-bucket-for-demo-modules-artisantek-2024"
}

variable "tags" {
  description = "tag for s3 bucket"
  type = string
  default = "terraform_s3"
}

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