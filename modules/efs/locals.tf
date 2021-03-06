locals {
  efs_service_account_namespace = "kube-system"
  efs_service_account_name      = "efs-csi-controller-sa"

  efs_fs_name = join("-", [var.efs_project_name_prefix, "efs", random_pet.efs_name.id])
  efs_ap_name = join("-", [var.efs_project_name_prefix, "efs", random_pet.efs_access_point_name.id])
  efs_sg_name = join("-", [var.efs_project_name_prefix, "efs-sg"])

  filesystem_tags = merge({
    Name        = local.efs_fs_name
    Project     = var.efs_project_name
    Environment = var.efs_environment
    Description = format("EFS FileSystem created for %s project and cluster %s", var.efs_project_name, var.efs_cluster_id)
    Source      = "Managed by Terraform"
    Type        = "EFS FileSystem"
  }, var.efs_tags)

  access_point_tags = merge({
    Name        = local.efs_ap_name
    Project     = var.efs_project_name
    Environment = var.efs_environment
    Description = format("EFS FileSystem Access Point created for %s project and cluster %s", var.efs_project_name, var.efs_cluster_id)
    Source      = "Managed by Terraform"
    Type        = "EFS Access Point"
  }, var.efs_tags)

  efs_sg_tags = merge({
    Name        = local.efs_sg_name
    Project     = var.efs_project_name
    Environment = var.efs_environment
    Description = format("Security Group created for %s project and cluster %s", var.efs_project_name, var.efs_cluster_id)
    Source      = "Managed by Terraform"
    Type        = "EFS Security Group"
  }, var.efs_tags)
}