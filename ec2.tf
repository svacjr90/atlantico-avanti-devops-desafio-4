resource "aws_instance" "web-server-2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.bt-avantiSG.id]
  user_data              = local.user_data

  tags = {
    Type = "web-server"
  }
}

