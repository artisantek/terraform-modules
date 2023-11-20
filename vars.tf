variable "bucket_name" {
  description = "se-terra-bucket-1908"
  type        = string
  default = "terraform-s3-modules"
}

variable "force_destroy" {
  description = "indicates all objects should be deleted"
  type        = string
  default     = false
}

variable "versioning" {
  description = "A state of versioning"
  type        = string
  default     = false
}
