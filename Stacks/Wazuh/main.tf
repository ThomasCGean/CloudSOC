locals {
  common_tags = merge(
    {
      Name        = "${var.name}-${var.environment}"
      Project     = "CloudSOC"
      Environment = var.environment
      Tool        = "Wazuh"
      ManagedBy   = "Terraform"
      Owner       = "SOC"
    },
    var.tags
  )
}

resource "aws_instance" "wazuh" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  vpc_security_group_ids      = [var.wazuh_security_group_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = local.common_tags
}