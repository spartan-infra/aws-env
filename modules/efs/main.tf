resource "aws_efs_file_system" "efs_fs" {
  creation_token = local.efs_fs_name
  tags           = local.filesystem_tags
}

resource "aws_efs_mount_target" "efs_mount_target" {
  count           = length(var.efs_cluster_subnet_ids)
  file_system_id  = aws_efs_file_system.efs_fs.id
  subnet_id       = element(var.efs_cluster_subnet_ids, count.index)
  security_groups = [aws_security_group.efs_security_group.id]
}

resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.efs_fs.id
  tags           = local.access_point_tags
}
