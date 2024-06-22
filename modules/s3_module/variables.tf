variable "bucket_name" {
  description = "Name of the s3 bucket"
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tags for the s3 bucket"
  type        = map(string)
  default = {
    environment = "dev"
    terraform   = "true"
  }
}
variable "decision" {
  description = "Option for Allow force_destroy option for s3 bucket"
  type        = string
  default     = true
}