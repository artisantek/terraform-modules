variable "key-name" {
  description = "Enter The Key Pair Name to be created on AWS"
}

variable "k8s-master-size" {
  description = "Enter The Key Instance type to be used for K8S Master"
}

variable "k8s-worker-size" {
  description = "Enter The Key Instance type to be used for K8S Worker Nodes"
}

variable "k8s-worker-count" {
  description = "Enter The K8S Worker Nodes to be created"
}

variable "ami" {
  description = "Enter The Ubuntu AMI to be used for EC2 Instances"
}

variable "vpc-id" {
  description = "Enter the VPC-ID under which the security group has to be created"
}

