variable "db_project_name_prefix" {
  description = "[REQUIRED] Project name used as prefix."
  type        = string
}

variable "db_project_name" {
  description = "[REQUIRED] Project name."
  type        = string
}

variable "db_environment" {
  description = "[REQUIRED] Current environment where the resources will be deployed."
  type        = string
}

variable "db_vpc_id" {
  description = "[REQUIRED] VPC Id where the RDS Cluster will be deployed."
  type        = string
}

variable "db_allowed_security_groups" {
  description = "[REQUIRED] Security groups needed to establish connections with the database"
  type        = list(string)
}

variable "db_vpc_subnet_group_name" {
  description = "[REQUIRED] Subnet group name created by the VPC module. It will be used to start a new RDS Cluster."
  type        = string
}

variable "db_engine" {
  description = "[OPTIONAL] RDS MySQL Aurora engine."
  type        = string
  default     = "aurora-mysql"
}

variable "db_family" {
  description = "[OPTIONAL] RDS MySQL Aurora family"
  type        = string
  default     = "aurora-mysql5.7"
}

variable "db_engine_version" {
  description = "[OPTIONAL] RDS MySQL Aurora engine version."
  type        = string
  default     = "5.7.12"
}

variable "db_instance_type" {
  description = "[OPTIONAL] RDS MySQL Aurora instance type."
  type        = string
  default     = "db.r5.large"
}

variable "db_replica_instance_type" {
  description = "[OPTIONAL] RDS MySQL Aurora replica instance type."
  type        = string
  default     = "db.t3.medium"
}

variable "db_replica_count" {
  description = "[OPTIONAL] RDS MySQL Aurora replica count."
  type        = number
  default     = 1
}

variable "db_cloudwatch_logs_exports" {
  description = "[OPTIONAL] Cloudwatch log exports for the RDS Cluster."
  type        = list(string)
  default     = ["audit", "error", "general", "slowquery"]
}

variable "db_password" {
  description = "[OPTIONAL] Aurora RDS Cluster password"
  type        = string
  default     = "adminadmin"
}

variable "db_additional_tags" {
  description = "[OPTIONAL] RDS Cluster additional tags."
  type        = map(string)
  default     = {}
}