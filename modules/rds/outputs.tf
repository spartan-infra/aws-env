output "rds_cluster_endpoint" {
  value = module.db.this_rds_cluster_endpoint
}

output "rds_instance_reader_endpoint" {
  value = module.db.this_rds_cluster_reader_endpoint
}