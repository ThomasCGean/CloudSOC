output "splunk_instance_id" {
  description = "EC2 instance ID for Splunk."
  value       = aws_instance.splunk.id
}

output "splunk_private_ip" {
  description = "Private IP of the Splunk instance."
  value       = aws_instance.splunk.private_ip
}

output "splunk_private_dns" {
  description = "Private DNS name of the Splunk instance."
  value       = aws_instance.splunk.private_dns
}

output "splunk_security_group_id" {
  description = "Attached Splunk security group ID."
  value       = var.splunk_security_group_id
}