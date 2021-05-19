resource "aws_instance" "jump_server" {
  ami                         = data.aws_ami.amazon_available_ami.id
  instance_type               = var.instance_type
  subnet_id                   = element(var.instance_public_subnet_id, 0)
  security_groups             = concat(var.instance_security_group_ids, [aws_security_group.remote_security_group.id])
  key_name                    = var.instance_key_pair_name
  associate_public_ip_address = true
  user_data_base64            = filebase64("${path.module}/templates/init.sh")

  tags = local.instance_tags
}