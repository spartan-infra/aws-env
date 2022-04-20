module "db" {
  source = "registry.terraform.io/terraform-aws-modules/rds-aurora/aws"

  name                  = local.aurora_rds_cluster_name
  engine                = var.db_engine
  engine_version        = var.db_engine_version
  instance_type         = var.db_instance_type
  instance_type_replica = var.db_replica_instance_type

  vpc_id                  = var.db_vpc_id
  db_subnet_group_name    = var.db_vpc_subnet_group_name
  create_security_group   = true
  allowed_security_groups = var.db_allowed_security_groups

  replica_count                       = var.db_replica_count
  iam_database_authentication_enabled = false
  password                            = var.db_password
  create_random_password              = false

  apply_immediately   = true
  skip_final_snapshot = true

  db_parameter_group_name         = aws_db_parameter_group.db_parameter_group.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.cluster_parameter_group.id
  enabled_cloudwatch_logs_exports = var.db_cloudwatch_logs_exports

  tags = local.rds_cluster_tags
}

resource "aws_db_parameter_group" "db_parameter_group" {
  name        = local.aurora_db_parameter_group_name
  family      = var.db_family
  description = local.aurora_db_param_group_description
  tags        = local.db_param_group_tags
}

resource "aws_rds_cluster_parameter_group" "cluster_parameter_group" {
  name        = local.aurora_cluster_parameter_group_name
  family      = var.db_family
  description = local.aurora_cluster_param_group_description
  tags        = local.cluster_param_group_tags
}