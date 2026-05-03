locals {
  common_tags = merge(
    {
      Name        = "${var.name}-${var.environment}"
      Project     = "CloudSOC"
      Environment = var.environment
      Tool        = "NLB"
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

resource "aws_lb" "soc_ingress" {
  name               = "${var.name}-${var.environment}"
  load_balancer_type = "network"
  internal           = false

  subnets         = var.public_subnet_ids
  security_groups = var.nlb_security_group_ids

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false

  tags = local.common_tags
}

resource "aws_lb_target_group" "wazuh_logs" {
  name        = "${var.name}-${var.environment}-wazuh-1514"
  port        = 1514
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    protocol = "TCP"
    port     = "1514"
  }

  tags = local.common_tags
}

resource "aws_lb_target_group" "wazuh_enroll" {
  name        = "${var.name}-${var.environment}-enroll-1515"
  port        = 1515
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    protocol = "TCP"
    port     = "1515"
  }

  tags = local.common_tags
}

resource "aws_lb_target_group" "splunk_uf" {
  name        = "${var.name}-${var.environment}-splunk-9997"
  port        = 9997
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    protocol = "TCP"
    port     = "9997"
  }

  tags = local.common_tags
}

resource "aws_lb_target_group_attachment" "wazuh_logs" {
  target_group_arn = aws_lb_target_group.wazuh_logs.arn
  target_id        = var.wazuh_private_ip
  port             = 1514
}

resource "aws_lb_target_group_attachment" "wazuh_enroll" {
  target_group_arn = aws_lb_target_group.wazuh_enroll.arn
  target_id        = var.wazuh_private_ip
  port             = 1515
}

resource "aws_lb_target_group_attachment" "splunk_uf" {
  target_group_arn = aws_lb_target_group.splunk_uf.arn
  target_id        = var.splunk_private_ip
  port             = 9997
}

resource "aws_lb_listener" "wazuh_logs" {
  load_balancer_arn = aws_lb.soc_ingress.arn
  port              = 1514
  protocol          = "TLS"
  certificate_arn   = var.acm_certificate_arn
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wazuh_logs.arn
  }
}

resource "aws_lb_listener" "wazuh_enroll" {
  load_balancer_arn = aws_lb.soc_ingress.arn
  port              = 1515
  protocol          = "TLS"
  certificate_arn   = var.acm_certificate_arn
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wazuh_enroll.arn
  }
}

resource "aws_lb_listener" "splunk_uf" {
  load_balancer_arn = aws_lb.soc_ingress.arn
  port              = 9997
  protocol          = "TLS"
  certificate_arn   = var.acm_certificate_arn
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_uf.arn
  }
}

resource "aws_route53_record" "wazuh" {
  zone_id = var.route53_zone_id
  name    = "wazuh.${var.domain_name}"
  type    = "A"

  allow_overwrite = true

  alias {
    name                   = aws_lb.soc_ingress.dns_name
    zone_id                = aws_lb.soc_ingress.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "enroll" {
  zone_id = var.route53_zone_id
  name    = "enroll.${var.domain_name}"
  type    = "A"

  allow_overwrite = true

  alias {
    name                   = aws_lb.soc_ingress.dns_name
    zone_id                = aws_lb.soc_ingress.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "hec" {
  zone_id = var.route53_zone_id
  name    = "hec.${var.domain_name}"
  type    = "A"

  allow_overwrite = true

  alias {
    name                   = aws_lb.soc_ingress.dns_name
    zone_id                = aws_lb.soc_ingress.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "uf" {
  zone_id = var.route53_zone_id
  name    = "uf.${var.domain_name}"
  type    = "A"

  allow_overwrite = true

  alias {
    name                   = aws_lb.soc_ingress.dns_name
    zone_id                = aws_lb.soc_ingress.zone_id
    evaluate_target_health = true
  }
}