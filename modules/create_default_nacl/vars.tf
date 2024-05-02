variable "default-network-acl-id" {
  description = "The default Network NACL ID of the VPC"
  type        = string
}

variable "subnet-ids" {
  description = "List of subnet IDs to associate with the default network ACL"
  type        = list(string)
  default     = []
}

variable "provision-default-nacl" {
  description = "Set to true to apply default NACL rules."
  type        = bool
  default     = false
}

variable "custom_egress_rules" {
  description = "List of custom egress rule definitions."
  type = list(object({
    rule_no    = number
    action     = string
    protocol   = string
    from_port  = number
    to_port    = number
    cidr_block = string
  }))
  default = []
}

variable "custom_ingress_rules" {
  description = "List of custom ingress rule definitions."
  type = list(object({
    rule_no    = number
    action     = string
    protocol   = string
    from_port  = number
    to_port    = number
    cidr_block = string
  }))
  default = []
}

