resource "aws_security_group" "postgres_security_group" {
  name_prefix = "${var.db_project_name_prefix}-"
  vpc_id      = var.db_vpc_id

  description = "Control traffic to/from Postgres SQL for project ${var.db_project_name}"
  tags        = local.db_security_group_tags
}

resource "aws_security_group_rule" "default_ingress" {
  count                    = length(var.allowed_security_groups)
  description              = "From allowed SGs"
  type                     = "ingress"
  from_port                = var.db_port
  to_port                  = var.db_port
  protocol                 = "tcp"
  source_security_group_id = element(var.allowed_security_groups, count.index)
  security_group_id        = aws_security_group.postgres_security_group.id
}