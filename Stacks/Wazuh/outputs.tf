output "wazuh_instance_id" {
  description = "Instance ID of the Wazuh VM."
  value       = aws_instance.wazuh.id
}

output "wazuh_private_ip" {
  description = "Private IP address of the Wazuh VM."
  value       = aws_instance.wazuh.private_ip
}

output "wazuh_private_dns" {
  description = "Private DNS name of the Wazuh VM."
  value       = aws_instance.wazuh.private_dns
}

output "wazuh_security_group_id" {
  description = "Security group ID attached to the Wazuh VM."
  value       = var.wazuh_security_group_id
}