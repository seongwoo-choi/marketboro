resource "aws_eip" "my-elastic-ip" {
  network_border_group = "ap-northeast-2"
  public_ipv4_pool     = "amazon"

  tags = {
    Name = "my-elastic-ip"
  }

  tags_all = {
    Name = "my-elastic-ip"
  }

  vpc = true
}
