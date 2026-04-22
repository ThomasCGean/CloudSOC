variable "aws_region" {
  type        = string
  description = "AWS region for the Splunk instance."
}

variable "name" {
  type        = string
  description = "Short name for the tool."
}

variable "environment" {
  type        = string
  description = "Environment name, such as dev."
}

variable "vpc_id" {
  type        = string
  description = "Existing VPC ID."
}

variable "subnet_id" {
  type        = string
  description = "Existing private subnet ID."
}

variable "ami_id" {
  type        = string
  description = "Golden AMI ID for Splunk."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
}

variable "instance_profile_name" {
  type        = string
  description = "Existing IAM instance profile name for SSM access."
}

variable "splunk_security_group_id" {
  type        = string
  description = "Existing Splunk security group ID."
}

variable "root_volume_size" {
  type        = number
  description = "Root EBS size in GiB."
}

variable "root_volume_type" {
  type        = string
  description = "Root EBS volume type."
  default     = "gp3"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to merge with common tags."
  default     = {}
}