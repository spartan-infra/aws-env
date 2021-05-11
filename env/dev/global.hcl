locals {
  project_environment = "dev"
  project_name        = "standard-project"
  eks_cluster_name    = "k8s-std"
  project_name_prefix = "std"
  project_tags = {
    Owner   = "damian.bruera@patagonian.it"
    Service = "Standard Project"
  }
}