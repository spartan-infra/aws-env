locals {
  aws_region             = "us-east-2"
  aws_profile            = "patagoniantraining"
  remote_bucket_name     = "tfstate-std-store"
  remote_lock_table_name = "tfstate-lock-table"
}

remote_state {
  backend = "s3"
  config = {
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    bucket         = local.remote_bucket_name
    dynamodb_table = local.remote_lock_table_name
    profile        = local.aws_profile
    encrypt        = true
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
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
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws        = ">= 3.22.0"
    local      = ">= 1.4"
    null       = ">= 2.1"
    template   = ">= 2.1"
    random     = ">= 2.1"
  }
}
EOF
}