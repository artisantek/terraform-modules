locals {
  default_nacl_rules = {
    egress = [
      { action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0, protocol = "-1", rule_no = 100 }
    ],
    ingress = [
      { action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0, protocol = "-1", rule_no = 100 },
      { action = "allow", cidr_block = "0.0.0.0/0", from_port = 0, to_port = 0, protocol = "-1", rule_no = 20 }
    ]
  }
}

resource "aws_default_network_acl" "default" {
  default_network_acl_id = var.default-network-acl-id
  subnet_ids             = var.subnet-ids

  dynamic "egress" {
    for_each = var.provision-default-nacl ? concat(local.default_nacl_rules.egress, var.custom_egress_rules) : var.custom_egress_rules
    content {
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      protocol   = egress.value.protocol
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      cidr_block = egress.value.cidr_block
    }
  }

  dynamic "ingress" {
    for_each = var.provision-default-nacl ? concat(local.default_nacl_rules.ingress, var.custom_ingress_rules) : var.custom_ingress_rules
    content {
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      protocol   = ingress.value.protocol
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      cidr_block = ingress.value.cidr_block
    }
  }
}


