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

variable "acm_certificate_arn" {
  type        = string
  description = "Existing ACM certificate ARN to use on TLS listeners. Terraform does not create this certificate."
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