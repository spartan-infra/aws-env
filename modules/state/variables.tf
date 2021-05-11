variable "state_project_name" {
  description = "[REQUIRED] Project name where the bucket belongs to"
  type        = string
}

variable "state_project_tags" {
  description = "[REQUIRED] Tags for the S3 bucket"
  type        = map(string)
}

variable "bucket_name" {
  description = "[REQUIRED] S3 bucket name where the Terraform states will be stored"
  type        = string
}

variable "table_name" {
  description = "[REQUIRED] DynamoDB table name, which will be used to lock the terraform execution"
  type        = string
}

variable "bucket_acl_mode" {
  description = "[OPTIONAL] Bucket ACL mode. By default it will be created as private to avoid external access"
  type        = string
  default     = "private"
}

variable "bucket_force_destroy" {
  description = "[OPTIONAL] Bucket force destroy policy"
  type        = bool
  default     = true
}

variable "bucket_versioning" {
  description = "[OPTIONAL] Enable/Disable bucket versioning"
  type        = bool
  default     = true
}

variable "bucket_sse_algorithm" {
  description = "[OPTIONAL] Bucket encryption algorithm. By default, the S3 bucket will use AES256"
  type        = string
  default     = "AES256"
}

variable "bucket_private_profile" {
  description = "[OPTIONAL] Variable used to create an S3 bucket only in private mode - external access blocked"
  type        = bool
  default     = true
}

variable "table_attribute_name" {
  description = "[OPTIONAL] Lock attribute id used to store the Terraform run id"
  type        = string
  default     = "LockID"
}

variable "table_read_capacity" {
  description = "[OPTIONAL] DynamoDB table read capacity"
  type        = number
  default     = 20
}

variable "table_write_capacity" {
  description = "[OPTIONAL] DynamoDB write read capacity"
  type        = number
  default     = 20
}

variable "table_attribute_type" {
  description = "[OPTIONAL] Table attribute type. Allowed values are: string, binary and number"
  type        = string
  default     = "string"
}