locals {
  sls_bucket_name = join("-", [var.sls_project_name_prefix, "bucket-code", var.sls_project_environment])

  sls_bucket_tags = merge({
    Name        = local.sls_bucket_name
    Project     = var.sls_project_name
    Environment = var.sls_project_environment
    Description = format("S3 bucket created for %s project to store lambda code", var.sls_project_name)
    Source      = "Managed by Terraform"
    Type        = "S3 Bucket"
  }, var.sls_project_tags)
}