resource "aws_s3_bucket" "sls_bucket_code" {
  bucket        = local.sls_bucket_name
  acl           = var.sls_bucket_acl_mode
  force_destroy = var.sls_bucket_force_destroy

  versioning {
    enabled = var.sls_bucket_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sls_bucket_sse_algorithm
      }
    }
  }

  tags = local.sls_bucket_tags
}

resource "aws_s3_bucket_public_access_block" "sls_bucket_access_block" {
  bucket = aws_s3_bucket.sls_bucket_code.id

  block_public_acls       = var.sls_bucket_private_profile
  block_public_policy     = var.sls_bucket_private_profile
  restrict_public_buckets = var.sls_bucket_private_profile
  ignore_public_acls      = var.sls_bucket_private_profile
}

data "archive_file" "lambda_golang_src" {
  output_path = "${path.module}/bin.zip"
  source_dir = "${path.module}/bin"

  type        = "zip"
}

resource "aws_s3_object" "lambda_golang" {
  bucket = aws_s3_bucket.sls_bucket_code.id

  key    = "bin.zip"
  source = data.archive_file.lambda_golang_src.output_path

  etag = filemd5(data.archive_file.lambda_golang_src.output_path)
}