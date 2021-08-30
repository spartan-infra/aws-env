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

variable "db_vpc_database_subnets" {
  description = "[REQUIRED] VPC Subnets where the Postgres db will be running"
  type        = list(string)
}

variable "db_vpc_id" {
  description = "[REQUIRED] VPC ID where the Postgres db will be running"
  type        = string
}

variable "db_engine" {
  description = "[OPTIONAL] Postgres engine name"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "[OPTIONAL] Postgres engine version"
  type        = string
  default     = "11.10"
}

variable "db_major_engine_version" {
  description = "[OPTIONAL] Postgres major engine version"
  type        = string
  default     = "11"
}

variable "db_engine_family" {
  description = "[OPTIONAL] Postgres db family"
  type        = string
  default     = "postgres11"
}

variable "db_instance_type" {
  description = "[OPTIONAL] Postgres db instance type"
  type        = string
  default     = "db.t3.large"
}

variable "db_storage_options" {
  description = "[OPTIONAL] Postgres storage options"
  type        = map(any)
  default = {
    storage = {
      allocated     = 20
      max_allocated = 100
      encryption    = false
    }
  }
}

variable "db_port" {
  description = "[OPTIONAL] Postgres listener port"
  type        = number
  default     = 5432
}

variable "db_credentials" {
  description = "[OPTIONAL] Postgres credentials"
  type        = map(any)
  default = {
    creds = {
      username = "admin"
      password = "Testing12345"
    }
  }
}

variable "db_az_enabled" {
  description = "[OPTIONAL] Create a multi-az Postgres databaese"
  type        = bool
  default     = false
}

variable "db_maintenance_configuration" {
  description = "[OPTIONAL] Postgres maintenance window configuration"
  type        = map(any)
  default = {
    maintenance = {
      window        = "Mon:00:00-Mon:03:00"
      backup_window = "03:00-06:00"
      logs_exports  = ["postgresql", "upgrade"]
    }
  }
}

variable "db_backup_parameters" {
  description = "[OPTIONAL] Postgres backup parameters"
  type        = map(any)
  default = {
    backup = {
      retention_period    = 0
      skip_final_snapshot = true
    }
  }
}

variable "db_prevent_deletion" {
  description = "[OPTIONAL] Prevent Postgres DB to be deleted"
  type        = bool
  default     = false
}

variable "db_monitoring_parameters" {
  description = "[OPTIONAL] Postgres monitoring parameters"
  type        = map(any)
  default = {
    monitor = {
      performance_insights_enabled          = true
      performance_insights_retention_period = 7
      create_monitoring_role                = true
      monitoring_interval                   = 60
    }
  }
}

variable "db_additional_tags" {
  description = "[OPTIONAL] RDS Cluster additional tags."
  type        = map(string)
  default     = {}
}

variable "allowed_security_groups" {
  description = "[OPTIONAL] Allowed security groups"
  type        = list(string)
  default     = []
}