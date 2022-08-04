resource "aws_internet_gateway" "my-internet-gateway" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  vpc_id = aws_vpc.my-vpc.id
}
