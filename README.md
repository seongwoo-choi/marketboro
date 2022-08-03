# marketboro

## eksctl? terraform?

기존의 [프로젝트](https://github.com/seongwoo-choi/OTT-Service-BE/blob/main/project_myeks.yaml)에서는 eksctl create -f project_myeks.yaml 을 사용하여 YAML 파일을 사용하여 EKS 를 구성했다.

이번 사전 과제에서는 Terraform 을 사용하여 EKS 를 구성하고자 한다.

## Terraform 구성 사항

1. AWS Network 구성
- VPC
- Public Subnet, Private Subnet
- Public Subnet Route Table
- Internet Gateway
- Nat Gateway
- Elastic Ip

2. AWS EKS 구성
- EKS Cluster
- EKS NodeGroup
- Security Group
- IAM Policy
- IAM Role

3. Bastion Host
- EC2 instance
- IAM Role
- IAM Policy
- Security Group
- IAM Instance Profile