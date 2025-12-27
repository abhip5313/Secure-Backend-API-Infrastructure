# BAstion Security Group

resource "aws_security_group" "bastion-sg" {
  name = "bastion-sg"
  vpc_id = aws_vpc.tf-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "For SSH Connection"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "All Traffic allow"
  }
}

# Backend Security Group

resource "aws_security_group" "backend-sg" {
  name = "backend-sg"
  vpc_id = aws_vpc.tf-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [ aws_security_group.bastion-sg.id ]
    description = "Allow Bastion EC2 to access this Backend server"
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = [ "10.0.0.0/16" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS Security Group

resource "aws_security_group" "rds-sg" {
  name = "rds-sg"
  vpc_id = aws_vpc.tf-vpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [ aws_security_group.backend-sg.id ]
    description = "To Allow Backend server"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}