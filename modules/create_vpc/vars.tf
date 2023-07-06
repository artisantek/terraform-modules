variable "vpc_cidr" {
  description = "The address space that is used by the VPC"
  type = string
}

variable "vpc_name" {
  description = "The name of the VPC to create"
  type = string
}

variable "subnet_name" {
  description = "The name of the Subnet to create"
  type = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type = string
}

variable "subnet_zone" {
  description = "The AZ's in which to deploy the subnet"
  type = string
}

variable "igw_name" {
  description = "The name of the IGW to create"
  type = string
}

variable "public_crt_name" {
  description = "The name of the Public Route Table to create"
  type = string
}


