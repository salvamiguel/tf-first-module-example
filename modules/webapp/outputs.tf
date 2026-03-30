output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "IP publica de la instancia"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "IP privada de la instancia"
  value       = aws_instance.this.private_ip
}

output "security_group_id" {
  description = "ID del Security Group"
  value       = aws_security_group.this.id
}
