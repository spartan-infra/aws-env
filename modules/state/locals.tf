locals {
  bucket_name = var.bucket_name
  table_name  = var.table_name

  table_attribute_types = {
    "string" = "S"
    "number" = "N"
    "binary" = "B"
  }

  bucket_tags = merge(
    {
      Name        = local.bucket_name
      description = "S3 Bucket used for store the Terraform state"
    },
    var.state_project_tags
  )

  table_tags = merge(
    {
      Name        = local.table_name
      description = "DynamoDB table used to lock the Terraform state through executions"
    },
    var.state_project_tags
  )
}