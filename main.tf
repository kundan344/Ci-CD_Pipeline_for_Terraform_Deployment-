resource "aws_security_group" "devops-sg" {
  name        = "Devops-Security Group"
  description = "Open 22,443,80,8080,9000,3000,6443"

  # Define a single ingress rule to allow traffic on all specified ports
  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000, 6443] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Devops-sg"
  }
}


resource "aws_instance" "Sonar" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "ruchykeyohio"
  vpc_security_group_ids = [aws_security_group.devops-sg.id]
  user_data              = templatefile("./sonar.sh", {})

  tags = {
    Name = "Sonar-Server"
  }
  root_block_device {
    volume_size = 8
  }
}

