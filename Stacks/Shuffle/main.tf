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

resource "aws_security_group" "shuffle" {
  name        = "${local.resource_prefix}-sg"
  description = "Security group for the Shuffle EC2 instance"
  vpc_id      = var.vpc_id

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_prefix}-sg"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "shuffle_from_source_sgs" {
  for_each = toset(var.shuffle_allowed_source_sg_ids)

  security_group_id            = aws_security_group.shuffle.id
  referenced_security_group_id = each.value
  ip_protocol                  = "tcp"
  from_port                    = var.shuffle_ingress_port
  to_port                      = var.shuffle_ingress_port

  description = "Allow Shuffle inbound traffic from approved source security groups"
}

resource "aws_vpc_security_group_egress_rule" "shuffle_all_outbound_ipv4" {
  security_group_id = aws_security_group.shuffle.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  description = "Allow all outbound IPv4 traffic"
}

resource "aws_vpc_security_group_egress_rule" "shuffle_all_outbound_ipv6" {
  security_group_id = aws_security_group.shuffle.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"

  description = "Allow all outbound IPv6 traffic"
}

resource "aws_instance" "shuffle" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.shuffle.id]
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