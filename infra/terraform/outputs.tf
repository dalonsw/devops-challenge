output "ec2_name" {
  description = "Nome da instância EC2"
  value       = aws_instance.app_instance.tags["Name"]
}

output "ec2_instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.app_instance.id
}