
output "instance_id" {
  value = aws_instance.project.id
}

output "instance_name" {
  value = aws_instance.project.tags["Name"]
}

output "public_ip" {
  value = aws_instance.project.public_ip
}

output "private_ip" {
  value = aws_instance.project.private_ip
}
