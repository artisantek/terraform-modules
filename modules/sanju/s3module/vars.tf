variable "bucket" {
    description = "The Name Of the bucket"
    type = string
    default = null 
}

variable "force_destroy" {
    description = "A boolean that indicates all objects"
    type = string
    default = false 
}

variable "versioning" {
    description = "(Optional) A state of versioning"
    type = string
    default = true
}
