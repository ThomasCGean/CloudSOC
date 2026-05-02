variable "aws_region" {
  description = "AWS region for the Suricata stack."
  type        = string
}

variable "name" {
  description = "Base name for the Suricata instance."
  type        = string
}

variable "environment" {
  description = "Deployment environment, such as dev."
  type        = string
}

variable "vpc_id" {
  description = "SOC VPC ID."
  type        = string
}

variable "subnet_id" {
  description = "Private subnet ID where Suricata will be deployed."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the prebuilt golden Suricata image."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Suricata."
  type        = string
  default     = "t3a.xlarge"
}

variable "instance_profile_name" {
  description = "Existing IAM instance profile name for SSM access."
  type        = string
}

variable "suricata_security_group_id" {
  description = "Existing security group ID for the Suricata management interface."
  type        = string
}

variable "suricata_monitor_security_group_id" {
  description = "Existing security group ID for the Suricata monitoring ENI. Must allow mirrored VXLAN traffic, usually UDP 4789, from mirrored sources."
  type        = string
}

variable "primary_private_ip" {
  description = "Optional fixed private IP for the primary management ENI. Leave null to let AWS assign one."
  type        = string
  default     = null
}

variable "monitor_private_ip" {
  description = "Optional fixed private IP for the secondary monitoring ENI. Leave null to let AWS assign one."
  type        = string
  default     = null
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
  description = "Whether to associate a public IP. Should normally be false."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to merge with default tags."
  type        = map(string)
  default     = {}
}