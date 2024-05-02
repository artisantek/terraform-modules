output "security-group-id" {
  value       = aws_security_group.security_group.id
  description = "The ID of the security group created within the module."
}