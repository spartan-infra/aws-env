variable "vpc_project_name_prefix" {
  description = "[REQUIRED] Project name used as prefix."
  type        = string
}

variable "vpc_project_name" {
  description = "[REQUIRED] Project name."
  type        = string
}

variable "vpc_environment" {
  description = "[REQUIRED] Current environment where the resources will be deployed."
  type        = string
}

variable "vpc_base_cidr" {
  description = "[REQUIRED] VPC base IP. This will be used to build the CIDR."
  type        = string
}

variable "vpc_base_subnet_mask" {
  description = "[REQUIRED] VPC base subnet mask. This should be only the number after the / character."
  type        = number
}

variable "vpc_subnet_masks" {
  description = "[REQUIRED] The mask for each subnet. This should be only the number after the / character."
  type        = number
}

variable "vpc_nat_gateway_enabled" {
  description = "[OPTIONAL] Create NAT Gateway for private network internet access."
  type        = bool
  default     = true
}

variable "vpc_gateway_enabled" {
  description = "[OPTIONAL] Create VPC Gateway for internet access."
  type        = bool
  default     = true
}

variable "vpc_dns_support_enabled" {
  description = "[OPTIONAL] Enable DNS support for the VPC."
  type        = bool
  default     = true
}

variable "vpc_dns_hostnames_enabled" {
  description = "[OPTIONAL] Enable DNS hostnames for the VPC."
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "[OPTIONAL] VPC module extra tags."
  type        = map(string)
  default     = {}
}

variable "vpc_public_subnet_tags" {
  description = "[OPTIONAL] Public subnet extra tags."
  type        = map(string)
  default     = {}
}

variable "vpc_private_subnet_tags" {
  description = "[OPTIONAL] Private subnet extra tags."
  type        = map(string)
  default     = {}
}
