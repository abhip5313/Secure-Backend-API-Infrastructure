resource "aws_key_pair" "tf-key" {
  key_name = "terraform"
  public_key = var.public-key
}

resource "aws_instance" "bastion-instance" {
  ami = var.ami-id
  security_groups = [ aws_security_group.bastion-sg.id ]
  instance_type = var.instance-type
  subnet_id = aws_subnet.public.id
  key_name = aws_key_pair.tf-key.id
}

resource "aws_instance" "backend-instance" {
  ami = var.ami-id
  instance_type = var.instance-type
  key_name = aws_key_pair.tf-key.id
  subnet_id = aws_subnet.private-backend.id
  security_groups = [ aws_security_group.backend-sg.id ]
}