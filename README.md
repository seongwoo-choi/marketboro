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

3. Bastion Host 구성
- EC2 instance
- IAM Role
- IAM Policy
- Security Group
- IAM Instance Profile

## EKS Kubeconfig 설정
```bash
$ ssh -i "ec2-key-pair" ubuntu@<Bastion Host Public Ip>
$ aws eks update-kubeconfig --region <Region 명> --name
```

## Docker 설치 스크립트
```bash
DOCKER_USER=ubuntu

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker $DOCKER_USER
```

## eksctl cli 설치
```bash
$ curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl _$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
$ sudo mv /tmp/eksctl /usr/local/bin
$ eksctl version
```

## Jenkins 설치 
```bash
$ docker run --name jenkins -d -p 8080:8080 -v ~/jenkins:/var/jenkins_home -u root jenkins/jenkins:latest
```

## ingress-alb IAM Policy 생성
ALB 를 사용하기 위한 IAM 정책을 생성한다.

[alb 공식문서](https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/aws-load-balancer-controller.html)

위 문서를 참고하여 IAM 정책을 다운받은 후 iam-policy.tf 에 해당 정책을 연결하여 생성. 

해당 정책을 EKS 내에서 ALB 서비스를 관장하는 SA 에 붙여줄 것이다.

```bash
$ terraform init
$ terrform plan
$ terraform apply
```

## aws-load-balancer-controller IAM Role / EKS SA 생성
eksctl 명령어로 EKS 내에서 ALB 서비스를 관장하는 SA 를 생성한다. 

위에서 생성한 alb 용 IAM Policy 를 붙여준다.

```bash
$ eksctl craete iamserviceaccount \
--cluster=my-eks-cluster \
--namespace=kube-system \
--attach-policy-arn=arn:aws:iam::007442965030:policy/my-alb-iam-policy \
--override-existing-serviceaccounts \
--approve
```
