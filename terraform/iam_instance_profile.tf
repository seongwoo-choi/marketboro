# EC2 인스턴스 리소스 권한을 맵핑하는 부분
# IAM Role 과 바로 맵핑하지 않고 EC2 인스턴스에 프로파일을 통해 여러개의 권한(역할)을 부여
resource "aws_iam_instance_profile" "my-bastion-instance-profile" {
  name = "my-bastion-instance-profile"
  path = "/"
  # IAM Role 을 부착 aws_iam_instance_profile 리소스에 부착
  role = "my-iam-role-ec2-instance-bastion"
}
