variable "region" {
  description = "The AWS region where the S3 bucket will be created."
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply to the S3 bucket."
  type        = string
  default     = "private" # Other options: public-read, public-read-write, authenticated-read, log-delivery-write, bucket-owner-read, bucket-owner-full-control
}
