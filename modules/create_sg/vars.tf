variable "vpc-id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "security-group-name" {
  description = "Name of the security group"
  type        = string
}

variable "provision-master-default-ingress" {
  description = "Flag to deploy all default ingress rules if true, or selective rules if false."
  type        = bool
  default     = false
}

variable "provision-worker-default-ingress" {
  description = "Flag to deploy all default ingress rules if true, or selective rules if false."
  type        = bool
  default     = false
}

variable "provision-master-default-egress" {
  description = "Flag to deploy all default egress rules if true, or selective rules if false."
  type        = bool
  default     = false
}

variable "provision-worker-default-egress" {
  description = "Flag to deploy all default egress rules if true, or selective rules if false."
  type        = bool
  default     = false
}

variable "ingress-cidr" {
  description = "Default CIDR blocks for the security group rules"
  type        = string
}

variable "custom-ingress-rules" {
  description = "Map of rule identifiers to their corresponding settings, including ports, protocol, description, optional CIDR blocks, and optional referenced security group ID."
  type = map(object({
    from_port         = number
    to_port           = number
    protocol          = string
    description       = string
    cidr_ipv4         = string
    security_group_id = string
  }))
  default = {}
}

variable "custom-egress-rules" {
  description = "Map of rule identifiers to their corresponding settings, including ports, protocol, description, optional CIDR blocks, and optional referenced security group ID."
  type = map(object({
    from_port         = number
    to_port           = number
    protocol          = string
    description       = string
    cidr_ipv4         = string
    security_group_id = string
  }))
  default = {}
}


