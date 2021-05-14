data "aws_eks_cluster" "eks_cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = module.eks.cluster_id
}

data "aws_caller_identity" "current" {
}
