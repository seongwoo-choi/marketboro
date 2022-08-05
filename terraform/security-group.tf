########### EKS Security Group ###########

resource "aws_security_group" "my-sg-eks-cluster" {
  name        = "my-sg-eks-cluster"
  description = "security_group for my-eks-cluster"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = "my-sg-eks-cluster"
  }
}

# EKS Cluster 에 인그레스 보안 규칙 부착
resource "aws_security_group_rule" "my-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.my-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for my-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

# EKS Cluster 에 아웃바운드 보안 규칙 부착
resource "aws_security_group_rule" "my-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.my-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for my-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

########### Bastion Host Security Group ###########
# 라우팅 테이블에서
# Bastion Host 이 위치한 서브넷의 VPC 대역과 EKS 가 존재하는 서브넷의 VPC 대역이 같기 때문에 따로 보안 그룹 인그레스 처리를 안해도 Bastion Host 에서 Private Subnet 에 있는 노드 그룹에 접근 가능하다.
# EKS 노드가 Private Subnet 에 띄워지는 경우에 Bastion Host 를 통해서 통신을 해야 한다.
resource "aws_security_group" "my-sg-bastion" {

  name   = "my-sg-bastion"
  vpc_id = aws_vpc.my-vpc.id

  # 모든 IP 열어놓는 것은 좋은 방법은 아니나 편의상 모든 IP 에서 22 번 포트로 접근할 수 있게 설정
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for Jenkins"
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for bastion"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "my-sg-bastion"
  }
}

########### DB Security Group ###########

resource "aws_security_group" "my-sg-db" {

  name   = "my-sg-db"
  vpc_id = aws_vpc.my-vpc.id

  # 테스트 용도이기 때문에 모든 포트에 열어놓음
  ingress {
    cidr_blocks = [0.0.0.0/0]
#    security_groups = [aws_security_group.my-sg-bastion.id, aws_security_group.my-sg-eks-cluster.id]
    description     = "ingress security_group_rule for db"
    from_port       = "3306"
    protocol        = "tcp"
    self            = "false"
    to_port         = "3306"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for db"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  depends_on = [
    aws_security_group.my-sg-bastion,
    aws_security_group.my-sg-eks-cluster
  ]

  tags = {
    Name = "my-sg-db"
  }
}