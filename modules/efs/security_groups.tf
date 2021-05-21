resource "aws_security_group" "efs_security_group" {
  name        = local.efs_sg_name
  vpc_id      = var.efs_vpc_id
  description = "EFS filesystem security group."

  ingress {
    from_port       = 2049
    protocol        = "tcp"
    to_port         = 2049
    security_groups = var.efs_cluster_security_group_ids
  }

  egress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = var.efs_cluster_security_group_ids
  }

  tags = local.efs_sg_tags
}