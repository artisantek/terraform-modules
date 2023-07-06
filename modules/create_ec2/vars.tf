variable "instance_type" {
  description = "The Instance type to be used for the instance"
  type = string
}

variable "instance_ami" {
  description = "The AMI to be used for the instance"
  type = string
}

variable "instance_key" {
  description = "The Key to be used for the instance"
  type = string
}

variable "instance_name" {
  description = "The name of the instance to create"
  type = string
}