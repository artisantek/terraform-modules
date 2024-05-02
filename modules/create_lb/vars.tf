variable "load-balancer-type" {
  description = "Specifies the type of Load Balancer to create: either 'Application' or 'Network'."
  type        = string
}

variable "load-balancer-name" {
  description = "Defines the name for the Load Balancer."
  type        = string
}

variable "environment-tag" {
  description = "Assigns an environment tag to the Load Balancer for identification and management purposes."
  type        = string
}

variable "vpc-id" {
  description = "Provides the VPC ID where the Target Group will be deployed."
  type        = string
}

variable "subnet-ids" {
  description = "Provides a list of subnet IDs where the Load Balancer will be deployed."
  type        = list(string)
  default     = []
}

variable "security-group-ids" {
  description = "Associates a set of Security Group IDs with the Load Balancer for defining access controls."
  type        = list(string)
  default     = []
}

variable "target_groups" {
  description = "List of target group configurations for the Load Balancer"
  type = list(object({
    name     = string
    port     = number
    protocol = string
  }))
  default = []
}

variable "listeners" {
  description = "List of listeners to attach to the Load Balancer, linking to target groups or providing fixed responses or redirects based on configuration."
  type = map(object({
    port        = number
    protocol    = string
    action_type = string
    forward = optional(object({
      target_group_key = string
    }))
    fixed_response = optional(object({
      content_type = string
      message_body = optional(string) // Making message_body optional
      status_code  = string
    }))
  }))
  default = {}
}




