locals {
  common_tags = merge(
    {
      Name        = "${var.name}-${var.environment}"
      Project     = "CloudSOC"
      Environment = var.environment
      Tool        = "Suricata"
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

resource "aws_instance" "suricata" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  private_ip                  = var.primary_private_ip
  vpc_security_group_ids      = [var.suricata_security_group_id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = var.associate_public_ip_address

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }

  tags = local.common_tags
}

resource "aws_network_interface" "suricata_monitor" {
  subnet_id        = var.subnet_id
  security_groups  = [var.suricata_monitor_security_group_id]
  private_ips      = var.monitor_private_ip == null ? null : [var.monitor_private_ip]
  source_dest_check = false

  tags = merge(
    local.common_tags,
    {
      Name    = "${var.name}-${var.environment}-monitor-eni"
      Purpose = "SuricataTrafficMirrorTarget"
    }
  )
}

resource "aws_network_interface_attachment" "suricata_monitor_attach" {
  instance_id          = aws_instance.suricata.id
  network_interface_id = aws_network_interface.suricata_monitor.id
  device_index         = 1
}