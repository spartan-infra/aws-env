locals {
  k8s_service_account_namespace = "kube-system"
  k8s_service_account_name      = "loadbalancer-ingress-controller-sa"

  disk_parameters     = lookup(var.k8s_worker_ebs_parameters, "disk")
  instance_parameters = lookup(var.k8s_worker_parameters, "worker")

  instance_tags = merge({
    Project     = var.k8s_project_name
    Environment = var.k8s_project_environment
    Description = format("Worker instances created for %s project", var.k8s_project_name)
    Source      = "Managed by Terraform"
    Type        = "Instance"
  }, var.k8s_cluster_tags)

  volume_tags = merge({
    Project     = var.k8s_project_name
    Environment = var.k8s_project_environment
    Description = format("Root volumes created for %s project", var.k8s_project_name)
    Source      = "Managed by Terraform"
    Type        = "Volume"
  }, var.k8s_cluster_tags)

  launch_template_tags = merge({
    Project     = var.k8s_project_name
    Environment = var.k8s_project_environment
    Description = format("Launch Template created for %s project", var.k8s_project_name)
    Source      = "Managed by Terraform"
    Type        = "Launch Template"
  }, var.k8s_cluster_tags)

  cluster_tags = merge({
    Project     = var.k8s_project_name
    Environment = var.k8s_project_environment
    Description = format("Cluster created for %s project", var.k8s_project_name)
    Source      = "Managed by Terraform"
    Type        = "Cluster"
  }, var.k8s_cluster_tags)

  node_group_tags = merge({
    Project     = var.k8s_project_name
    Environment = var.k8s_project_environment
    Description = format("Node Group created for %s project and cluster %s", var.k8s_project_name, var.k8s_cluster_name)
    Source      = "Managed by Terraform"
    Type        = "Node Group"
  }, var.k8s_cluster_tags)
}