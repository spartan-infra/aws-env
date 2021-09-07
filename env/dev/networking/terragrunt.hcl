terraform {
  source = "../../..//modules/vpc"
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

  public_subnet_tags = merge({
    "kubernetes.io/role/elb"                      = "1"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  }, local.project_tags)

  private_subnet_tags = merge({
    "kubernetes.io/role/internal-elb"             = "1"
    "kubernetes.io/cluster/${local.cluster_name}" = "owned"
  })

  vpc_base_ip   = "10.0.0.0"
  vpc_base_mask = 20
  subnets_mask  = 23
}

inputs = {
  vpc_project_name_prefix = local.project_prefix
  vpc_project_name        = local.project_name
  vpc_environment         = local.project_environment
  vpc_base_cidr           = local.vpc_base_ip
  vpc_base_subnet_mask    = local.vpc_base_mask
  vpc_subnet_masks        = local.subnets_mask
  vpc_extra_tags          = local.project_tags
  vpc_public_subnet_tags  = local.public_subnet_tags
  vpc_private_subnet_tags = local.private_subnet_tags
}