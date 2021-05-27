locals {
  vpc_name = join("-", [var.vpc_project_name_prefix, random_pet.vpc_name.id])

  vpc_cidr           = join("/", [var.vpc_base_cidr, var.vpc_base_subnet_mask])
  cidrsubnet_newbits = (var.vpc_subnet_masks - var.vpc_base_subnet_mask)

  vpc_private_subnets = [
    cidrsubnet(local.vpc_cidr, local.cidrsubnet_newbits, 0),
    cidrsubnet(local.vpc_cidr, local.cidrsubnet_newbits, 1)
  ]

  vpc_public_subnets = [
    cidrsubnet(local.vpc_cidr, local.cidrsubnet_newbits, 2),
    cidrsubnet(local.vpc_cidr, local.cidrsubnet_newbits, 3)
  ]

  vpc_database_subnets = [
    cidrsubnet(local.vpc_cidr, local.cidrsubnet_newbits, 4),
    cidrsubnet(local.vpc_cidr, local.cidrsubnet_newbits, 5)
  ]

  vpc_tags = merge({
    Project     = var.vpc_project_name
    Environment = var.vpc_environment
    Description = "VPC created for standard project"
    Source      = "Managed by Terraform"
  }, var.vpc_tags)

  public_subnet_tags = merge({
    Project     = var.vpc_project_name
    Environment = var.vpc_environment
    Description = "Public subnet created for standard project"
    Source      = "Managed by Terraform"
  }, var.vpc_public_subnet_tags)

  private_subnet_tags = merge({
    Project     = var.vpc_project_name
    Environment = var.vpc_environment
    Description = "Private subnet created for standard project"
    Source      = "Managed by Terraform"
  }, var.vpc_private_subnet_tags)

  database_subnet_tags = merge({
    Project     = var.vpc_project_name
    Environment = var.vpc_environment
    Description = "Database subnet created for standard project"
    Source      = "Managed by Terraform"
  }, var.vpc_db_subnet_tags)
}