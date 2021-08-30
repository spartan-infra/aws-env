terraform {
  source = "../../..//modules/rds-postgres"
}

dependency "networking" {
  config_path = "../networking"

  mock_outputs = {
    vpc_id                         = ""
    vpc_database_subnets           = ["", ""]
    vpc_database_subnet_group_name = "vpc_tbd_id"
  }
}

dependency "kubernetes" {
  config_path = "../kubernetes"

  mock_outputs = {
    cluster_security_groups = ["", ""]
  }
}

dependency "jump" {
  config_path = "../jump"

  mock_outputs = {
    instance_remote_security_group_id = ""
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  global_vars           = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  project_environment   = local.global_vars.locals.project_environment
  project_prefix        = local.global_vars.locals.project_name_prefix
  project_name          = local.global_vars.locals.project_name
  project_tags          = local.global_vars.locals.project_tags
  instance_type         = "db.t3.medium"
  replica_instance_type = "db.t3.small"
  instance_count        = 1
}

inputs = {
  db_project_name_prefix     = local.project_prefix
  db_project_name            = local.project_name
  db_environment             = local.project_environment
  db_vpc_database_subnets    = dependency.networking.outputs.vpc_database_subnets
  db_vpc_id                  = dependency.networking.outputs.vpc_id
  db_additional_tags         = local.project_tags
  db_allowed_security_groups = concat(dependency.kubernetes.outputs.cluster_security_groups, [dependency.jump.outputs.instance_remote_security_group_id])
  db_instance_type           = local.instance_type
}