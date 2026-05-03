locals {
  common_tags = merge(
    {
      Name        = "${var.name}-${var.environment}"
      Project     = "CloudSOC"
      Environment = var.environment
      Tool        = "WindowsHost"
      ManagedBy   = "Terraform"
      Owner       = "SOC"
    },
    var.tags
  )
}

resource "aws_instance" "windows_host" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  tags = local.common_tags
}