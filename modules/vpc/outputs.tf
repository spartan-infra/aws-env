output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_public_subnets" {
  value = module.vpc.public_subnets
}

output "vpc_private_subnets" {
  value = module.vpc.private_subnets
}

output "vpc_database_subnets" {
  value = module.vpc.database_subnets
}

output "vpc_availability_zones" {
  value = tolist(module.vpc.azs)
}

output "vpc_database_subnet_group_name" {
  value = module.vpc.database_subnet_group_name
}