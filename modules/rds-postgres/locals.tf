locals {
  db_identifier      = join("-", [var.db_project_name_prefix, "postgres", var.db_environment])
  db_name            = join("-", [var.db_project_name_prefix, "db", var.db_environment])
  db_storage_options = lookup(var.db_storage_options, "storage")
  db_credentials     = lookup(var.db_credentials, "creds")
  db_maintenance     = lookup(var.db_maintenance_configuration, "maintenance")
  db_backup          = lookup(var.db_backup_parameters, "backup")
  db_monitoring      = lookup(var.db_monitoring_parameters, "monitor")

  db_instance_tags = merge({
    Name        = local.db_name
    Description = format("PostgresSQL DB created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "PostgresSQL"
  }, var.db_additional_tags)

  db_security_group_tags = merge({
    Description = format("Security Group PostgresSQL DB created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "PostgresSQL"
  }, var.db_additional_tags)

  db_option_group_tags = merge({
    Description = format("Option Group DB created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "Option Group - PostgresSQL"
  }, var.db_additional_tags)

  db_parameter_group_tags = merge({
    Description = format("Parameter Group DB created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "Option Group - PostgresSQL"
  }, var.db_additional_tags)
}