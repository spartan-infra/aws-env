resource "aws_launch_template" "cluster_launch_template" {
  name_prefix            = var.k8s_project_name_prefix
  description            = format("Launch-Template created for %s project", var.k8s_project_name)
  update_default_version = true
  key_name               = var.k8s_ssh_key_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = lookup(local.disk_parameters, "size")
      volume_type           = lookup(local.disk_parameters, "type")
      delete_on_termination = lookup(local.disk_parameters, "termination_delete")
    }
  }

  monitoring {
    enabled = lookup(local.instance_parameters, "monitoring")
  }

  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = concat([module.eks.worker_security_group_id], var.k8s_worker_additional_security_groups)
  }

  # Supplying custom tags to EKS instances is another use-case for LaunchTemplates
  tag_specifications {
    resource_type = "instance"
    tags          = local.instance_tags
  }

  # Supplying custom tags to EKS instances root volumes is another use-case for LaunchTemplates. (doesnt add tags to dynamically provisioned volumes via PVC tho)
  tag_specifications {
    resource_type = "volume"
    tags          = local.volume_tags
  }

  # Tag the LT itself
  tags = local.launch_template_tags

  lifecycle {
    create_before_destroy = true
  }
}