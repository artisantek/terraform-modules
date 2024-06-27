variable "instance_type" {
  description = "this is inst type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "this is inst type"
  default     = "ami-01b799c439fd5516a"

}

variable "key_name" {
  description = "this is inst type"
  default     = "new"
}

variable "bucket_name" {
  description = "name of d bucket"
  type        = string
}

variable "tag" {
  description = "tags for s3"
  type        = map(string)
}
