terraform {
  source = "../../..//modules/efs"
}

dependency "networking" {
  config_path = "../networking"

  mock_outputs = {
    vpc_id              = ""
    vpc_private_subnets = ["", ""]
  }
}

dependency "kubernetes" {
  config_path = "../kubernetes"

  mock_outputs = {
    cluster_id                = ""
    cluster_oidc_provider_url = ""
    cluster_security_groups   = ["", ""]
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  global_vars         = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  project_environment = local.global_vars.locals.project_environment
  project_prefix      = local.global_vars.locals.project_name_prefix
  project_name        = local.global_vars.locals.project_name
  project_tags        = local.global_vars.locals.project_tags
  cluster_name        = local.global_vars.locals.eks_cluster_name
}

inputs = {
  efs_project_name               = local.project_name
  efs_project_name_prefix        = local.project_prefix
  efs_environment                = local.project_environment
  efs_tags                       = local.project_tags
  efs_cluster_id                 = dependency.kubernetes.outputs.cluster_id
  efs_cluster_oidc_issuer_url    = dependency.kubernetes.outputs.cluster_oidc_provider_url
  efs_cluster_security_group_ids = dependency.kubernetes.outputs.cluster_security_groups
  efs_cluster_subnet_ids         = dependency.networking.outputs.vpc_private_subnets
  efs_vpc_id                     = dependency.networking.outputs.vpc_id
}