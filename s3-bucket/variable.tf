variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error."
  type        = bool
  default     = false
}

variable "versioning_status" {
  description = "The versioning state of the bucket."
  type        = string
  default     = "Enabled"
}

