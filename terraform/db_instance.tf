resource "aws_db_instance" "my-db-instance" {
  identifier             = "marketboro"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  max_allocated_storage  = 100
  engine                 = "mysql"
  engine_version         = "8.0.20"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = var.db_port
  db_subnet_group_name   = aws_db_subnet_group.my-db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.my-sg-db.id]
  multi_az               = false
  publicly_accessible    = true
  skip_final_snapshot    = true

  depends_on = [
    aws_vpc.my-vpc
  ]
}