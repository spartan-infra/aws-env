locals {
  aurora_rds_cluster_name             = join("-", [var.db_project_name_prefix, "mysql"])
  aurora_db_parameter_group_name      = join("-", [local.aurora_rds_cluster_name, "aurora-db-57-parameter-group"])
  aurora_cluster_parameter_group_name = join("-", [local.aurora_rds_cluster_name, "aurora-57-cluster-parameter-group"])

  aurora_db_param_group_description      = format("Database Parameter Group created for %s project", var.db_project_name)
  aurora_cluster_param_group_description = format("Cluster Parameter Group created for %s project", var.db_project_name)

  rds_cluster_tags = merge({
    Name        = local.aurora_rds_cluster_name
    Description = format("Aurora RDS Cluster - MySQL created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "RDS Aurora Cluster - MySQL"
  }, var.db_additional_tags)

  db_param_group_tags = merge({
    Name        = local.aurora_db_parameter_group_name
    Description = format("RDS Cluster db parameter group created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "RDS Aurora DB Parameter Group"
  }, var.db_additional_tags)

  cluster_param_group_tags = merge({
    Name        = local.aurora_cluster_parameter_group_name
    Description = format("RDS cluster parameter group created for %s project", var.db_project_name)
    Source      = "Managed by Terraform"
    Type        = "RDS Aurora Cluster Parameter Group"
  }, var.db_additional_tags)
}