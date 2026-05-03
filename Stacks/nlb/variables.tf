variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type    = string
  default = "nlb"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "nlb_security_group_ids" {
  type        = list(string)
  description = "Existing security group IDs to attach to the Network Load Balancer."
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 Hosted Zone ID for thomascloudsoc.com"
}

variable "domain_name" {
  type    = string
  default = "thomascloudsoc.com"
}

variable "wazuh_private_ip" {
  type        = string
  description = "Private IP address of the Wazuh manager."
}

variable "splunk_private_ip" {
  type        = string
  description = "Private IP address of the Splunk indexer."
  default     = "10.0.11.110"
}

variable "tags" {
  type    = map(string)
  default = {}
}