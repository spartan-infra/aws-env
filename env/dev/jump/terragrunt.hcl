terraform {
  source = "../../..//modules/ec2"
}

dependency "networking" {
  config_path = "../networking"

  mock_outputs = {
    vpc_id             = ""
    vpc_public_subnets = ["", ""]
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  global_vars            = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  project_environment    = local.global_vars.locals.project_environment
  project_prefix         = local.global_vars.locals.project_name_prefix
  project_name           = local.global_vars.locals.project_name
  project_tags           = local.global_vars.locals.project_tags
  cluster_name           = local.global_vars.locals.eks_cluster_name
  remote_access_key_name = "ssh-key"
  aws_instance_type      = "t2.micro"
}

inputs = {
  instance_project_name        = local.project_name
  instance_project_name_prefix = local.project_prefix
  instance_project_environment = local.project_environment
  instance_vpc_id              = dependency.networking.outputs.vpc_id
  instance_public_subnet_id    = dependency.networking.outputs.vpc_public_subnets
  instance_key_pair_name       = local.remote_access_key_name
  instance_additional_tags     = local.project_tags
  instance_type                = local.aws_instance_type
}