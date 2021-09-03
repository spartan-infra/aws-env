output "efs_fs_id" {
  value = aws_efs_file_system.efs_fs.id
}

output "efs_fs_arn" {
  value = aws_efs_file_system.efs_fs.arn
}

output "efs_irsa_role_arn" {
  value = module.iam_assumable_role_admin.this_iam_role_arn
}