variable "sls_project_environment" {
  description = "[REQUIRED] Project environment where the resources are created."
  type        = string
}

variable "sls_project_name" {
  description = "[REQUIRED] Project name."
  type        = string
}

variable "sls_project_name_prefix" {
  description = "[REQUIRED] Project name prefix."
  type        = string
}

variable "sls_project_tags" {
  description = "[REQUIRED] Global tags to be applied into different resources."
  type        = map(string)
}

variable "sls_bucket_acl_mode" {
  description = "[OPTIONAL] ACL access mode. Default to private."
  type        = string
  default     = "private"
}

variable "sls_bucket_force_destroy" {
  description = "[OPTIONAL] Force S3 bucket destruction?"
  type        = bool
  default     = true
}

variable "sls_bucket_versioning" {
  description = "[OPTIONAL] Enable bucket versioning."
  type        = bool
  default     = true
}

variable "sls_bucket_sse_algorithm" {
  description = "[OPTIONAL] Bucket encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "sls_bucket_private_profile" {
  description = "[OPTIONAL] S3 bucket access profile."
  type        = bool
  default     = true
}