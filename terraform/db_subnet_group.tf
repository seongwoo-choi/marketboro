resource "aws_db_subnet_group" "my-db-subnet-group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.my-private-db-subnet1.id, aws_subnet.my-private-db-subnet3.id]

  tags = {
    Name = "My DB private subnet group"
  }
}