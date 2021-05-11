data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc_name
  cidr = local.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  private_subnets = local.vpc_private_subnets
  public_subnets  = local.vpc_public_subnets

  enable_nat_gateway   = var.vpc_nat_gateway_enabled
  enable_vpn_gateway   = var.vpc_gateway_enabled
  enable_dns_support   = var.vpc_dns_support_enabled
  enable_dns_hostnames = var.vpc_dns_hostnames_enabled

  private_subnet_tags = local.private_subnet_tags
  public_subnet_tags  = local.public_subnet_tags
  tags                = local.vpc_tags
}