variable "aws_region" {
  description = "AWS region for the Shuffle stack."
  type        = string
}

variable "name" {
  description = "Short name of the stack/component."
  type        = string
  default     = "shuffle"
}

variable "environment" {
  description = "Environment name, such as dev, test, or prod."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the Shuffle instance will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "Private subnet ID for the Shuffle instance."
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the prebuilt golden Shuffle image."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Shuffle."
  type        = string
  default     = "t3a.large"
}

variable "instance_profile_name" {
  description = "IAM instance profile name to attach to the Shuffle EC2 instance, usually for SSM access."
  type        = string
}

variable "shuffle_security_group_id" {
  description = "Existing security group ID to attach to the Shuffle EC2 instance."
  type        = string
}

variable "root_volume_size" {
  description = "Size in GiB of the root EBS volume."
  type        = number
  default     = 60
}

variable "root_volume_type" {
  description = "EBS volume type for the root volume."
  type        = string
  default     = "gp3"
}

variable "shuffle_ingress_port" {
  description = "Port exposed by Shuffle for internal access, typically 3001."
  type        = number
  default     = 3001
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP to the Shuffle instance. Leave false for private-subnet deployment."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to apply to created resources."
  type        = map(string)
  default     = {}
}