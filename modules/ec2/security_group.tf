resource "aws_security_group" "remote_security_group" {
  name        = local.security_group_name
  vpc_id      = var.instance_vpc_id
  description = "Remote Access Security Group"

  dynamic "ingress" {
    for_each = local.port_mappings

    content {
      from_port   = ingress.key
      protocol    = "tcp"
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.security_groups_tags
}