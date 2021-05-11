terraform {
  source = "../../..//modules/ecr"
}

include {
  path = find_in_parent_folders()
}

locals {
  global_vars         = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  project_environment = local.global_vars.locals.project_environment
  project_name        = local.global_vars.locals.project_name
  project_tags        = local.global_vars.locals.project_tags

  api_names = [
    "api-gateway",
    "api-inventory",
    "api-tis"
  ]
}

inputs = {
  image_registry_project_name = local.project_name
  image_registry_api_names    = local.api_names
  image_registry_project_tags = local.project_tags
}