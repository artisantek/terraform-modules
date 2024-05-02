output "vpc-id" {
  value       = aws_vpc.vpc.id
  description = "The ID of VPC"
}

output "default-network-acl-id" {
  value       = aws_vpc.vpc.default_network_acl_id
  description = "The ID of VPC"
}

output "public-subnet-ids" {
  value       = aws_subnet.public_subnet.*.id
  description = "List of IDs of public subnets"
}

output "private-subnet-ids" {
  value       = aws_subnet.private_subnet.*.id
  description = "List of IDs of private subnets"
}

output "all-subnet-ids" {
  value       = concat(aws_subnet.public_subnet.*.id, aws_subnet.private_subnet.*.id)
  description = "List of all subnet IDs, both public and private"
}
