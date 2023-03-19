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
 # default     = "private"
}

variable "public-access" {
  description = "Set public access settings for the S3 bucket"
  type        = string
  default     = "none"
}

variable "versioning-enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
 # default     = false
}

variable "tags" {
  description = "Tags to be applied to the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "bucket-key-enabled" {
  description = "Enable bucket key for the S3 bucket"
  type        = bool
 # default     = true
}

variable "object-lock-enabled" {
  description = "Enable object lock for the S3 bucket"
  type        = bool
 # default     = false
}

variable "encryption-type" {
  description = "Encryption type for the S3 bucket"
  type        = string
 # default     = "aws:kms"
}



