output "s3_bucket_id" {
  value = aws_s3_bucket.tf_state_bucket.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.tf_state_bucket.arn
}

output "dynamo_table_id" {
  value = aws_dynamodb_table.tfstate_lock_table.id
}

output "dynamo_table_arn" {
  value = aws_dynamodb_table.tfstate_lock_table.arn
}
