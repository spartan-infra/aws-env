locals {
  security_group_name = join("-", [var.instance_project_name_prefix, "remote-sg"])
  instance_name       = join("-", [var.instance_project_name_prefix, "jump-server"])

  port_mappings = merge({
    22 = "22"
  }, var.instance_additional_ports)

  instance_tags = merge({
    Name        = local.instance_name
    Project     = var.instance_project_name
    Environment = var.instance_project_environment
    Description = format("EC2 instance created for %s project", var.instance_project_name)
    Source      = "Managed by Terraform"
    Type        = "EC2 Instance"
  }, var.instance_additional_tags)

  security_groups_tags = merge({
    Project     = var.instance_project_name
    Environment = var.instance_project_environment
    Description = format("Security Group created for %s project", var.instance_project_name)
    Source      = "Managed by Terraform"
    Type        = "Security Group"
  }, var.instance_additional_tags)
}