locals {
  project_environment = "dev"
  project_name        = "wr-vv-project"
  eks_cluster_name    = "k8s-wr-vv"
  project_name_prefix = "wr-vv"
  project_tags = {
    Owner   = "damian.bruera@xxxyyy.com"
    Service = "wr-vv"
  }
}