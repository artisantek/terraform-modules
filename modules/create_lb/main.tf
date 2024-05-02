resource "aws_lb" "load_balancer" {
  name               = var.load-balancer-name
  load_balancer_type = var.load-balancer-type
  subnets            = var.subnet-ids
  security_groups    = var.security-group-ids

  tags = {
    "Environment" = var.environment-tag
  }
}

# Dynamically create target groups based on input
variable "target_groups" {
  description = "List of target group configurations for the Load Balancer"
  type = list(object({
    name     = string
    port     = number
    protocol = string
  }))
  default = []
}

resource "aws_lb_target_group" "target-group" {
  for_each = { for tg in var.target_groups : tg.name => tg }

  name        = each.value.name
  port        = each.value.port
  protocol    = each.value.protocol
  vpc_id      = var.vpc-id
  target_type = "ip"
}

resource "aws_lb_listener" "listener" {
  for_each = var.listeners

  load_balancer_arn = aws_lb.load_balancer.arn
  port              = each.value.port
  protocol          = each.value.protocol

  dynamic "default_action" {
    for_each = each.value.action_type == "forward" ? [each.value.forward] : []
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.target-group[default_action.value.target_group_key].arn
    }
  }

  dynamic "default_action" {
    for_each = each.value.action_type == "fixed-response" ? [each.value.fixed_response] : []
    content {
      type = "fixed-response"
      fixed_response {
        content_type = default_action.value.content_type
        message_body = lookup(default_action.value, "message_body", null) // Handling optional message_body
        status_code  = default_action.value.status_code
      }
    }
  }
}

