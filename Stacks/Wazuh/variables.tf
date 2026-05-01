variable "aws_region" {
  description = "AWS region for this deployment."
  type        = string
}

variable "name" {
  description = "Short service name."
  type        = string
}

variable "environment" {
  description = "Environment name, such as dev."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the SOC environment."
  type        = string
}

variable "subnet_id" {
  description = "Private subnet ID where the instance will be launched."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the prebuilt golden Wazuh image."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the Wazuh VM."
  type        = string
}

variable "instance_profile_name" {
  description = "Existing IAM instance profile name for SSM access."
  type        = string
}

variable "wazuh_security_group_id" {
  description = "Existing security group ID to attach to the Wazuh instance."
  type        = string
}

variable "private_ip" {
  description = "Static private IP to assign to the Wazuh instance."
  type        = string
  default     = "10.0.11.121"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 60
}

variable "root_volume_type" {
  description = "Root EBS volume type."
  type        = string
  default     = "gp3"
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address. Normally false."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to merge into the default tag set."
  type        = map(string)
  default     = {}
}