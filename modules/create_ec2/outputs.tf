output "instance_id" {
  value = aws_instance.my-instance.id
}

output "instance_publicip" {
  value = aws_instance.my-instance.public_ip
}
