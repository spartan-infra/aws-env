module "iam_assumable_role_admin" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "3.6.0"
  create_role                   = true
  role_name                     = "efs-storage-controller"
  provider_url                  = replace(var.efs_cluster_oidc_issuer_url, "https://", "")
  role_policy_arns              = [aws_iam_policy.efs_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${local.efs_service_account_namespace}:${local.efs_service_account_name}"]
}

resource "aws_iam_policy" "efs_policy" {
  name        = "AmazonEKS_EFS_CSI_Driver_Policy"
  description = "EFS Controller policy for cluster ${var.efs_cluster_id}"
  policy      = data.aws_iam_policy_document.efs_policy_document.json
}

data "aws_iam_policy_document" "efs_policy_document" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "elasticfilesystem:DescribeAccessPoints",
      "elasticfilesystem:DescribeFileSystems"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "elasticfilesystem:CreateAccessPoint"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      values   = ["true"]
      variable = "aws:RequestTag/efs.csi.aws.com/cluster"
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "elasticfilesystem:DeleteAccessPoint"
    ]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      values   = ["true"]
      variable = "aws:ResourceTag/efs.csi.aws.com/cluster"
    }
  }
}