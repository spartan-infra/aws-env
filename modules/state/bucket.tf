resource "aws_s3_bucket" "tf_state_bucket" {
  bucket        = local.bucket_name
  acl           = var.bucket_acl_mode
  force_destroy = var.bucket_force_destroy

  versioning {
    enabled = var.bucket_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.bucket_sse_algorithm
      }
    }
  }

  tags = local.bucket_tags
}

resource "aws_s3_bucket_public_access_block" "tf_state_access_block" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = var.bucket_private_profile
  block_public_policy     = var.bucket_private_profile
  restrict_public_buckets = var.bucket_private_profile
  ignore_public_acls      = var.bucket_private_profile
}