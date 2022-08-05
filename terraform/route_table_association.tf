
########## Public Subnet Route Tables Association ########## 

resource "aws_route_table_association" "my-route-association-pub-sub1" {
  route_table_id = aws_route_table.my-route-table-pub-sub1.id
  subnet_id      = aws_subnet.my-public-subnet1.id
}

resource "aws_route_table_association" "my-route-association-pub-sub3" {
  route_table_id = aws_route_table.my-route-table-pub-sub3.id
  subnet_id      = aws_subnet.my-public-subnet3.id
}

########## Private Subnet Route Tables Association ########## 

resource "aws_route_table_association" "my-route-association-pri-sub1" {
  route_table_id = aws_route_table.my-route-table-pri-sub1.id
  subnet_id      = aws_subnet.my-private-subnet1.id
}

resource "aws_route_table_association" "my-route-association-pri-sub3" {
  route_table_id = aws_route_table.my-route-table-pri-sub3.id
  subnet_id      = aws_subnet.my-private-subnet3.id
}

resource "aws_route_table_association" "my-route-association-pri-db-sub1" {
  route_table_id = aws_route_table.my-route-table-pri-db-sub1.id
  subnet_id      = aws_subnet.my-private-db-subnet1.id
}

resource "aws_route_table_association" "my-route-association-pri-db-sub3" {
  route_table_id = aws_route_table.my-route-table-pri-db-sub3.id
  subnet_id      = aws_subnet.my-private-db-subnet3.id
}