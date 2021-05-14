variable "k8s_project_name" {
  description = "[REQUIRED] Project name."
  type        = string
}

variable "k8s_project_name_prefix" {
  description = "[REQUIRED] Project name prefix."
  type        = string
}

variable "k8s_project_environment" {
  description = "[REQUIRED] Environment where the worker nodes will be deployed"
  type        = string
}

variable "k8s_cluster_name" {
  description = "[REQUIRED] Kubernetes cluster name."
  type        = string
}

variable "k8s_cluster_version" {
  description = "[REQUIRED] Kubernetes version."
  type        = string
}

variable "k8s_vpc_id" {
  description = "[REQUIRED] VPC ID where the cluster will be deployed."
  type        = string
}

variable "k8s_subnet_ids" {
  description = "[REQUIRED] Subnets available for the cluster."
  type        = list(string)
}

variable "k8s_worker_ebs_parameters" {
  description = "[OPTIONAL] EBS configuration parameters for each worker node."
  type        = map(any)
  default = {
    disk = {
      size               = 100
      type               = "gp2"
      termination_delete = true
    }
  }
}

variable "k8s_worker_parameters" {
  description = "[OPTIONAL] Worker nodes configuration parameters."
  type        = map(any)
  default = {
    worker = {
      instance_type    = "c5.2xlarge"
      min_capacity     = 1
      desired_capacity = 1
      max_capacity     = 2
      monitoring       = true
    }
  }
}

variable "k8s_worker_additional_security_groups" {
  description = "[OPTIONAL] Worker nodes additional security groups."
  type        = list(string)
  default     = [""]
}

variable "k8s_cluster_tags" {
  description = "[OPTIONAL] Kubernetes cluster additional tags."
  type        = map(string)
  default     = {}
}

variable "k8s_write_kubernetes_configuration" {
  description = "[REQUIRED] Write down to local the kubeconfig file."
  type        = bool
  default     = true
}