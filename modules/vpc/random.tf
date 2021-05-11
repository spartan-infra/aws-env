resource "random_pet" "vpc_name" {
  length    = 2
  separator = "-"

  keepers = {
    base_ip = var.vpc_base_cidr
    mask    = var.vpc_base_subnet_mask
  }
}