
########## Public Subnet Route Tables ########## 

resource "aws_route_table" "my-route-table-pub-sub1" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_internet_gateway.my-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "my-route-table-pub-sub1"
  }

  tags_all = {
    Name = "my-route-table-pub-sub1"
  }

  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route_table" "my-route-table-pub-sub3" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_internet_gateway.my-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-internet-gateway.id
  }

  tags = {
    Name = "my-route-table-pub-sub3"
  }

  tags_all = {
    Name = "my-route-table-pub-sub3"
  }

  vpc_id = aws_vpc.my-vpc.id
}

#resource "aws_route_table" "my-route-table-pub-db-sub1" {
#
#  depends_on = [
#    aws_vpc.my-vpc,
#    aws_internet_gateway.my-internet-gateway
#  ]
#
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.my-internet-gateway.id
#  }
#
#  tags = {
#    Name = "my-route-table-pub-db-sub1"
#  }
#
#  tags_all = {
#    Name = "my-route-table-pub-db-sub1"
#  }
#
#  vpc_id = aws_vpc.my-vpc.id
#}
#
#resource "aws_route_table" "my-route-table-pub-db-sub3" {
#
#  depends_on = [
#    aws_vpc.my-vpc,
#    aws_internet_gateway.my-internet-gateway
#  ]
#
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.my-internet-gateway.id
#  }
#
#  tags = {
#    Name = "my-route-table-pub-db-sub3"
#  }
#
#  tags_all = {
#    Name = "my-route-table-pub-db-sub3"
#  }
#
#  vpc_id = aws_vpc.my-vpc.id
#}


########## Private Subnet Route Tables ########## 

resource "aws_route_table" "my-route-table-pri-sub1" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_nat_gateway.my-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-gateway.id
  }

  tags = {
    Name = "my-route-table-pri-sub1"
  }

  tags_all = {
    Name = "my-route-table-pri-sub1"
  }

  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route_table" "my-route-table-pri-sub3" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_nat_gateway.my-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-gateway.id
  }

  tags = {
    Name = "my-route-table-pri-sub3"
  }

  tags_all = {
    Name = "my-route-table-pri-sub3"
  }

  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route_table" "my-route-table-pri-db-sub1" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_nat_gateway.my-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-gateway.id
  }

  tags = {
    Name = "my-route-table-pri-db-sub1"
  }

  tags_all = {
    Name = "my-route-table-pri-db-sub1"
  }

  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route_table" "my-route-table-pri-db-sub3" {

  depends_on = [
    aws_vpc.my-vpc,
    aws_nat_gateway.my-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.my-nat-gateway.id
  }

  tags = {
    Name = "my-route-table-pri-db-sub3"
  }

  tags_all = {
    Name = "my-route-table-pri-db-sub3"
  }

  vpc_id = aws_vpc.my-vpc.id
}
