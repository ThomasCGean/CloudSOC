output "windows_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.windows_host.id
}

output "windows_private_ip" {
  description = "Private IP address"
  value       = aws_instance.windows_host.private_ip
}

output "windows_public_ip" {
  description = "Public IP address"
  value       = aws_instance.windows_host.public_ip
}

output "windows_private_dns" {
  description = "Private DNS name"
  value       = aws_instance.windows_host.private_dns
}

output "windows_security_group_id" {
  description = "Security group ID attached to the instance"
  value       = var.security_group_id
}