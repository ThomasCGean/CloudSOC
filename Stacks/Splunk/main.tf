locals {
  resource_prefix = "${var.name}-${var.environment}"

  common_tags = merge(
    {
      Name        = local.resource_prefix
      Project     = "CloudSOC"
      Environment = var.environment
      Tool        = "Shuffle"
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

resource "aws_instance" "shuffle" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.shuffle_security_group_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    encrypted             = true
    delete_on_termination = true

    tags = merge(
      local.common_tags,
      {
        Name = "${local.resource_prefix}-root"
      }
    )
  }

  tags = local.common_tags
}