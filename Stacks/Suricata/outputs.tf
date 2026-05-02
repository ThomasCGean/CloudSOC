output "suricata_instance_id" {
  description = "EC2 instance ID for Suricata."
  value       = aws_instance.suricata.id
}

output "suricata_private_ip" {
  description = "Primary private IP for Suricata."
  value       = aws_instance.suricata.private_ip
}

output "suricata_private_dns" {
  description = "Private DNS name for Suricata."
  value       = aws_instance.suricata.private_dns
}

output "suricata_primary_network_interface_id" {
  description = "Primary management ENI ID for Suricata."
  value       = aws_instance.suricata.primary_network_interface_id
}

output "suricata_monitor_network_interface_id" {
  description = "Secondary monitoring ENI ID for Suricata. Use this as the future Traffic Mirror Target ENI."
  value       = aws_network_interface.suricata_monitor.id
}

output "suricata_monitor_private_ip" {
  description = "Private IP of the secondary monitoring ENI."
  value       = aws_network_interface.suricata_monitor.private_ip
}

output "suricata_security_group_id" {
  description = "Security group attached to Suricata primary management interface."
  value       = var.suricata_security_group_id
}

output "suricata_monitor_security_group_id" {
  description = "Security group attached to Suricata monitoring ENI."
  value       = var.suricata_monitor_security_group_id
}