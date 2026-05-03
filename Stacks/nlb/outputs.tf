output "nlb_dns_name" {
  value = aws_lb.soc_ingress.dns_name
}

output "nlb_arn" {
  value = aws_lb.soc_ingress.arn
}

output "wazuh_logs_target_group_arn" {
  value = aws_lb_target_group.wazuh_logs.arn
}

output "wazuh_enroll_target_group_arn" {
  value = aws_lb_target_group.wazuh_enroll.arn
}

output "splunk_uf_target_group_arn" {
  value = aws_lb_target_group.splunk_uf.arn
}