terraform {
  source = "..//modules/state"
}

locals {
  aws_region   = "us-east-2"
  aws_profile  = "patagoniantraining"
  project_name = "standard-project"
  project_tags = {
    Owner   = "damian.bruera@patagonian.it"
    Service = "Standard Project"
  }
  bucket_name    = "tfstate-std-store"
  table_name     = "tfstate-lock-table"
  read_capacity  = 5
  write_capacity = 5
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
  }
}
EOF
}

inputs = {
  state_project_name   = local.project_name
  state_project_tags   = local.project_tags
  bucket_name          = local.bucket_name
  table_name           = local.table_name
  table_read_capacity  = local.read_capacity
  table_write_capacity = local.write_capacity
}