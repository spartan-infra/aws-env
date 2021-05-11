resource "aws_dynamodb_table" "tfstate_lock_table" {
  hash_key = var.table_attribute_name
  name     = local.table_name

  read_capacity  = var.table_read_capacity
  write_capacity = var.table_write_capacity

  attribute {
    name = var.table_attribute_name
    type = lookup(local.table_attribute_types, var.table_attribute_type)
  }

  tags = local.table_tags
}