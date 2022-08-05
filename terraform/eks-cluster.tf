resource "aws_eks_cluster" "my-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.my-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.my-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.my-iam-role-eks-cluster.arn
  version  = "1.21"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids      = [aws_security_group.my-sg-eks-cluster.id]
    subnet_ids              = [aws_subnet.my-private-subnet1.id, aws_subnet.my-private-subnet3.id]
    endpoint_public_access  = false
    endpoint_private_access = true
  }
}