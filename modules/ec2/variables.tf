variable "instance_project_name" {
  description = "[REQUIRED] Project name."
  type        = string
}

variable "instance_project_name_prefix" {
  description = "[REQUIRED] Project name prefix."
  type        = string
}

variable "instance_project_environment" {
  description = "[REQUIRED] Environment where the worker nodes will be deployed"
  type        = string
}

variable "instance_public_subnet_id" {
  description = "[REQUIRED] Public subnet where the EC2 instance must be deployed"
  type        = list(string)
}

variable "instance_security_group_ids" {
  description = "[REQUIRED] EC2 instance security group ids"
  type        = list(string)
}

variable "instance_key_pair_name" {
  description = "[REQUIRED] EC2 key pair used for remote access"
  type        = string
}

variable "instance_vpc_id" {
  description = "[REQUIRED] VPC ID where the security group will be attached"
  type        = string
}

variable "instance_additional_tags" {
  description = "[OPTIONAL] EC2 instances additional tags."
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "[OPTIONAL] EC2 instance type"
  type        = string
  default     = "t2.small"
}

variable "instance_additional_ports" {
  description = "[OPTIONAL] EC2 additional service ports."
  type        = map(string)
  default     = {}
}