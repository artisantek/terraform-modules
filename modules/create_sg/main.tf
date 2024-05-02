resource "aws_security_group" "security_group" {
  name   = var.security-group-name
  vpc_id = var.vpc-id
}

locals {
  default_master_ingress_rules = {
    "ssh"  = { from_port = 22, to_port = 22, protocol = "tcp", description = "Allow SSH", cidr_ipv4 = var.ingress-cidr, security_group_id = null },
    "http" = { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow HTTP", cidr_ipv4 = var.ingress-cidr, security_group_id = null }
  }

  default_master_egress_rules = {
    "http" = { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow from Internet", cidr_ipv4 = "0.0.0.0/0", security_group_id = null }
  }

  default_worker_ingress_rules = {
    "internal" = { from_port = 3306, to_port = 3306, protocol = "tcp", description = "MySQL internal access", cidr_ipv4 = null, security_group_id = aws_security_group.security_group.id },
    "ipsec"    = { from_port = null, to_port = null, protocol = "10", description = "IpsecEsp", cidr_ipv4 = null, security_group_id = aws_security_group.security_group.id }
  }

  default_worker_egress_rules = {
    "http" = { from_port = 80, to_port = 80, protocol = "tcp", description = "Allow from Internet", cidr_ipv4 = "0.0.0.0/0", security_group_id = null }
  }
}

resource "aws_vpc_security_group_ingress_rule" "default_ingress_rules" {
  for_each = var.provision-master-default-ingress ? local.default_master_ingress_rules : var.provision-worker-default-ingress ? local.default_worker_ingress_rules : {}

  security_group_id = aws_security_group.security_group.id

  ip_protocol = each.value.protocol
  description = each.value.description

  from_port                    = each.value.from_port != null ? each.value.from_port : null
  to_port                      = each.value.to_port != null ? each.value.to_port : null
  cidr_ipv4                    = each.value.cidr_ipv4 != null ? each.value.cidr_ipv4 : null
  referenced_security_group_id = each.value.security_group_id != null ? each.value.security_group_id : null
}

resource "aws_vpc_security_group_ingress_rule" "custom_ingress_rules" {
  for_each = var.custom-ingress-rules

  security_group_id = aws_security_group.security_group.id

  ip_protocol = each.value.protocol
  description = each.value.description

  from_port                    = each.value.from_port != null ? each.value.from_port : null
  to_port                      = each.value.to_port != null ? each.value.to_port : null
  cidr_ipv4                    = each.value.cidr_ipv4 != null ? each.value.cidr_ipv4 : null
  referenced_security_group_id = each.value.security_group_id != null ? each.value.security_group_id : null
}

resource "aws_vpc_security_group_egress_rule" "default_egress_rules" {
  for_each = var.provision-master-default-egress ? local.default_master_egress_rules : var.provision-worker-default-egress ? local.default_worker_egress_rules : {}

  security_group_id = aws_security_group.security_group.id

  ip_protocol = each.value.protocol
  description = each.value.description

  from_port                    = each.value.from_port != null ? each.value.from_port : null
  to_port                      = each.value.to_port != null ? each.value.to_port : null
  cidr_ipv4                    = each.value.cidr_ipv4 != null ? each.value.cidr_ipv4 : null
  referenced_security_group_id = each.value.security_group_id != null ? each.value.security_group_id : null
}

resource "aws_vpc_security_group_egress_rule" "custom_egress_rules" {
  for_each = var.custom-egress-rules

  security_group_id = aws_security_group.security_group.id

  ip_protocol = each.value.protocol
  description = each.value.description

  from_port                    = each.value.from_port != null ? each.value.from_port : null
  to_port                      = each.value.to_port != null ? each.value.to_port : null
  cidr_ipv4                    = each.value.cidr_ipv4 != null ? each.value.cidr_ipv4 : null
  referenced_security_group_id = each.value.security_group_id != null ? each.value.security_group_id : null
}

