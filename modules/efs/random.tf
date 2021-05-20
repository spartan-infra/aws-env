resource "random_pet" "efs_name" {
  length    = 2
  separator = "-"

  keepers = {
    cluster_id          = var.efs_cluster_id
    cluster_oidc_issuer = var.efs_cluster_oidc_issuer_url
    project_prefix      = var.efs_project_name_prefix
  }
}

resource "random_pet" "efs_access_point_name" {
  length    = 2
  separator = "-"

  keepers = {
    cluster_id          = var.efs_cluster_id
    cluster_oidc_issuer = var.efs_cluster_oidc_issuer_url
    project_prefix      = var.efs_project_name_prefix
  }
}