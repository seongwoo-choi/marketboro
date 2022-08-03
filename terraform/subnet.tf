resource "aws_subnet" "my-public-subnet1" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "my-public-subnet1"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "my-public-subnet1"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "my-public-subnet3" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  # "kubernetes.io/cluster/my-eks-cluster" = "shared" -> 전체 Subnet 에 태그 부착
  # "kubernetes.io/role/elb"                 = 1      -> Public Subnet 에만 태그 부착
  tags = {
    Name                                     = "my-public-subnet3"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "my-public-subnet3"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-2c"
}



resource "aws_subnet" "my-private-subnet1" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  # "kubernetes.io/cluster/my-eks-cluster" = "shared" -> 전체 Subnet 에 태그 부착
  tags = {
    Name                                     = "my-private-subnet1"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "my-private-subnet1"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "my-private-subnet3" {

  depends_on = [
    aws_vpc.my-vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.48.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "my-private-subnet3"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "my-private-subnet3"
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
  }

  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-2c"
}
