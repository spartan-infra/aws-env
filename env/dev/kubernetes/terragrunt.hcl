terraform {
  source = "../../..//modules/eks"
}

dependency "networking" {
  config_path = "../networking"

  mock_outputs = {
    vpc_id              = ""
    vpc_private_subnets = ["", ""]
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  aws_region  = "us-east-2"
  aws_profile = "patagoniantraining"

  global_vars         = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  project_environment = local.global_vars.locals.project_environment
  project_prefix      = local.global_vars.locals.project_name_prefix
  project_name        = local.global_vars.locals.project_name
  project_tags        = local.global_vars.locals.project_tags
  cluster_name        = local.global_vars.locals.eks_cluster_name
  aws_cluster_version = "1.19"

  scaling_params = {
    worker = {
      instance_type = "c5.2xlarge"
      //      instance_type    = "t2.medium"
      min_capacity     = 1
      desired_capacity = 1
      max_capacity     = 2
      monitoring       = true
    }
  }
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  profile = "${local.aws_profile}"
  region  = "${local.aws_region}"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
}

terraform {
  required_version = ">= 0.13"
  required_providers {
    aws        = ">= 3.22.0"
    local      = ">= 1.4"
    null       = ">= 2.1"
    template   = ">= 2.1"
    random     = ">= 2.1"
    kubernetes = ">= 2.0.0"
  }
}
EOF
}

inputs = {
  k8s_project_name        = local.project_name
  k8s_project_name_prefix = local.project_prefix
  k8s_project_environment = local.project_environment
  k8s_cluster_name        = local.cluster_name
  k8s_cluster_version     = local.aws_cluster_version
  k8s_vpc_id              = dependency.networking.outputs.vpc_id
  k8s_subnet_ids          = dependency.networking.outputs.vpc_private_subnets
  k8s_cluster_tags        = local.project_tags
  k8s_worker_parameters   = local.scaling_params
}