variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Base name for the resource"
  type        = string
  default     = "windows-host"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-01559cd12ed60ae09"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "subnet-0cf4610c9fd97c799"
}

variable "ami_id" {
  description = "AMI ID for Windows host"
  type        = string
  default     = "ami-0bbade87bacefb97f"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3a.large"
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
  default     = "sg-08378d14c6748de64"
}

variable "instance_profile_name" {
  description = "IAM instance profile for SSM access"
  type        = string
  default     = "SOC-EC2-SSM-role"  
}

variable "associate_public_ip_address" {
  description = "Assign public IP"
  type        = bool
  default     = true  
}

variable "root_volume_size" {
  description = "Root volume size (GB)"
  type        = number
  default     = 60
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}