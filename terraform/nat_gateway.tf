resource "aws_nat_gateway" "my-nat-gateway" {

  depends_on = [
    aws_eip.my-elastic-ip
  ]

  allocation_id     = aws_eip.my-elastic-ip.id
  subnet_id         = aws_subnet.my-public-subnet3.id
  connectivity_type = "public"

  tags = {
    Name        = "my-nat-gateway"
  }

  tags_all = {
    Name        = "my-nat-gateway"
  }

}
