output "instance_public_ip" {
  value = aws_instance.jump_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.jump_server.public_dns
}

output "instance_remote_security_group_id" {
  value = aws_security_group.remote_security_group.id
}

output "instance_remote_security_group_arn" {
  value = aws_security_group.remote_security_group.arn
}