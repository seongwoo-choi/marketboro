resource "aws_db_subnet_group" "my-db-subnet-group" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.my-public-db-subnet1.id, aws_subnet.my-public-db-subnet1.id]

  tags = {
    Name = "My DB private subnet group"
  }
}