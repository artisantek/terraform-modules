 variable "bucket-name" {
  description = "Enter the name to be used for the S3 bucket"
  type        = string
}

variable "region" {
   description = "Enter the region to be used for the S3 bucket"
   type        = string
}

variable "acl" {
  description = "Access control for the S3 bucket"
  type        = string
}

variable "public-access-block" {
  description = "Set public access settings for the S3 bucket"
  type        = string
}

variable "versioning-enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "object-lock-enabled" {
   description = "Enable object lock for the S3 bucket"
}

variable "encryption-type" {
  description = "Encryption type for the S3 bucket"
  type        = string
 # default     = "aws:kms"
}



