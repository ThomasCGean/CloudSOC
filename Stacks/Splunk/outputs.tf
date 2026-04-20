output "shuffle_instance_id" {
  description = "EC2 instance ID for the Shuffle server."
  value       = aws_instance.shuffle.id
}

output "shuffle_private_ip" {
  description = "Private IP address of the Shuffle server."
  value       = aws_instance.shuffle.private_ip
}

output "shuffle_private_dns" {
  description = "Private DNS name of the Shuffle server."
  value       = aws_instance.shuffle.private_dns
}

output "shuffle_security_group_id" {
  description = "Security group ID attached to the Shuffle server."
  value       = var.shuffle_security_group_id
}

output "shuffle_ingress_port" {
  description = "Ingress port expected to be used for Shuffle."
  value       = var.shuffle_ingress_port
}