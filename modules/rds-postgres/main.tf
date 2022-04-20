module "db" {
  source = "registry.terraform.io/terraform-aws-modules/rds/aws"

  identifier = local.db_identifier

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  family               = var.db_engine_family        # DB parameter group
  major_engine_version = var.db_major_engine_version # DB option group
  instance_class       = var.db_instance_type

  allocated_storage     = lookup(local.db_storage_options, "allocated")
  max_allocated_storage = lookup(local.db_storage_options, "max_allocated")
  storage_encrypted     = lookup(local.db_storage_options, "encryption")

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  name     = replace(local.db_name, "-", "")
  username = lookup(local.db_credentials, "username")
  password = lookup(local.db_credentials, "password")
  port     = var.db_port

  multi_az               = var.db_az_enabled
  subnet_ids             = var.db_vpc_database_subnets
  vpc_security_group_ids = [aws_security_group.postgres_security_group.id]

  maintenance_window              = lookup(local.db_maintenance, "window")
  backup_window                   = lookup(local.db_maintenance, "backup_window")
  enabled_cloudwatch_logs_exports = lookup(local.db_maintenance, "logs_exports")

  backup_retention_period = lookup(local.db_backup, "retention_period")
  skip_final_snapshot     = lookup(local.db_backup, "skip_final_snapshot")
  deletion_protection     = var.db_prevent_deletion

  performance_insights_enabled          = lookup(local.db_monitoring, "performance_insights_enabled")
  performance_insights_retention_period = lookup(local.db_monitoring, "performance_insights_retention_period")
  create_monitoring_role                = lookup(local.db_monitoring, "create_monitoring_role")
  monitoring_interval                   = lookup(local.db_monitoring, "monitoring_interval")

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

  tags                    = local.db_instance_tags
  db_option_group_tags    = local.db_option_group_tags
  db_parameter_group_tags = local.db_parameter_group_tags
}