variable "image_registry_project_name" {
  description = "[REQUIRED] Project name which will be used as a parameter name prefix"
  type        = string
}

variable "image_registry_api_names" {
  description = "[REQUIRED] API names which will be used as ECR names"
  type        = list(string)
}

variable "image_registry_project_tags" {
  description = "[OPTIONAL] Tags applied to all registries"
  type        = map(string)
  default     = {}
}

variable "image_registry_tag_mutability" {
  description = "[OPTIONAL] Allow tag mutability on ECR, by default is IMMUTABLE"
  type        = string
  default     = "IMMUTABLE"
}