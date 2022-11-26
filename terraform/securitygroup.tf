resource "aws_security_group" "sg_acesso_ssh_publico" {
  description = "Libera porta SSH para internet"

  ingress {
    cidr_blocks = [var.ip_internet]
    description = "Porta SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    description = "Porta SSH"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.ip_internet]
  }
  tags = {
    "Name" = "${var.usuario}-sg_acesso_ssh_publico"
  }

}

resource "aws_security_group" "sg_acesso_web" {
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.ip_internet]
    }
    ingress {
        from_port = 81
        to_port = 86
        protocol = "tcp"
        cidr_blocks = [var.ip_internet]
    }
    tags = {
      "Name" = "${var.usuario}-sg_acesso_web"
    }
  
}
