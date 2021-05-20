variable "efs_project_name" {
  description = "[REQUIRED] Project name used for naming resources."
  type        = string
}

variable "efs_project_name_prefix" {
  description = "[REQUIRED] Project name prefix used for naming resources."
  type        = string
}

variable "efs_environment" {
  description = "[REQUIRED] Environment where the resources will be deployed."
  type        = string
}

variable "efs_cluster_id" {
  description = "[REQUIRED] EKS cluster id."
  type        = string
}

variable "efs_cluster_oidc_issuer_url" {
  description = "[REQUIRED] EKS cluster OpenId Connect issuer provider."
  type        = string
}

variable "efs_cluster_subnet_ids" {
  description = "[REQUIRED] Subnet list where the Storage will be available"
  type        = list(string)
}

variable "efs_cluster_security_group_ids" {
  description = "[REQUIRED] Security Groups used by the cluster."
  type        = list(string)
}

variable "efs_tags" {
  description = "[OPTIONAL] Resource tags."
  type        = map(string)
  default     = {}
}