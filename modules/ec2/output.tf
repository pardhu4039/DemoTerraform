output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "instance_private_ip" {
  value = aws_instance.example.private_ip
}
