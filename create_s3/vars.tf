variable "region" {
  description = "Region to create s3_bucket"
  type        = string
  default = ""
}

variable "bucket_prefix" {
  description = "Prefix of the bucket name to create"
  type        = string
  default = ""
}
variable "tags" {
  description = "A mapping of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}