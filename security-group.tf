#Configuração do security group para acesso ssh, http e https
resource "aws_security_group" "bt-avantiSG" {
  name        = "bt-avantiSG"
  description = "Allow incoming TCP 8080, HTTP, HTTPS e SSH connections."

  #Inbound
  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTP to EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }
 
  ingress {
    description = "Porta Site no EC2"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTPS to EC2"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  #Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Type = "security-group"
  }
}