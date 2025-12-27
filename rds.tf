
resource "aws_db_subnet_group" "rds-sb-g" {
  subnet_ids = [ 
    aws_subnet.private-db.id,
    aws_subnet.private-backend.id
   ]
}

resource "aws_db_instance" "rds-instance" {
  engine = "mysql"
  engine_version = "8.0"
  instance_class = var.db-instance-type
  allocated_storage = 40
  vpc_security_group_ids = [ aws_security_group.rds-sg.id ]
  db_subnet_group_name = aws_db_subnet_group.rds-sb-g.id
  username = var.db-username
  password = var.db-password
  db_name = var.db-name
  publicly_accessible = false
}