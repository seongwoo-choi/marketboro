resource "aws_instance" "my-ec2-bastion" {

  ami                         = "ami-0454bb2fefc7de534" # 우분투
  associate_public_ip_address = "true"    # 퍼블릭 IP 로 접근 가능
  availability_zone           = "ap-northeast-2a"  # 가용 영역 설정

  # 인스턴스 프로파일 설정 -> EC2 인스턴스에 역할(권한) 부여
  iam_instance_profile        = aws_iam_instance_profile.my-ec2-instance-profile.name
  # AWS 콘솔에서 미리 동록한 키페어의 이름
  key_name                    = "ec2-key-pair"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"

  instance_initiated_shutdown_behavior = "stop"

  # 인스턴스 유형 타입
  instance_type                        = "t2.small"

  # ipv6 어드레스 설정 안 함
  ipv6_address_count                   = "0"
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
  }

  monitoring = "false"

  # 인스턴스에 붙는 EBS 볼륨 설정
  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"

    tags = {
      Name        = "my-ec2-bastion-ebs"
    }

    # EBS 볼륨 사이즈 20Gi 로 설정
    volume_size = "20"
    volume_type = "gp2"
  }

  source_dest_check = "true"

  tags = {
    Name        = "my-ec2-bastion"
  }

  tags_all = {
    Name        = "my-ec2-bastion"
  }

  tenancy       = "default"

  # 인터넷 망과 접근하기 위한 Public Subnet 설정
  subnet_id     = aws_subnet.my-public-subnet1.id

  # VPC 에서 인스턴스를 생성하는 경우 vpc_security_group_ids 를 사용
  # my-sg-bastion.id 보안 그룹을 인스턴스에 부착
  vpc_security_group_ids = [aws_security_group.my-sg-bastion.id]
}

