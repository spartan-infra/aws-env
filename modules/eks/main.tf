module "eks" {
  source                               = "registry.terraform.io/terraform-aws-modules/eks/aws"
  cluster_name                         = var.k8s_cluster_name
  cluster_version                      = var.k8s_cluster_version
  vpc_id                               = var.k8s_vpc_id
  subnets                              = var.k8s_subnet_ids
  worker_additional_security_group_ids = var.k8s_worker_additional_security_groups
  write_kubeconfig                     = var.k8s_write_kubernetes_configuration
  tags                                 = local.cluster_tags
  enable_irsa                          = true

  node_groups = {
    std_ng = {
      desired_capacity = lookup(local.instance_parameters, "desired_capacity")
      max_capacity     = lookup(local.instance_parameters, "max_capacity")
      min_capacity     = lookup(local.instance_parameters, "min_capacity")
      instance_types   = [lookup(local.instance_parameters, "instance_type")]

      launch_template_id      = aws_launch_template.cluster_launch_template.id
      launch_template_version = aws_launch_template.cluster_launch_template.default_version

      additional_tags = local.node_group_tags
    }
  }
}