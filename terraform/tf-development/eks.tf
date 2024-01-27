resource "aws_eks_cluster" "demo" {
  name     = "eks-demo"
  role_arn = aws_iam_role.eks_role.arn

  version = var.kube_version

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false

    security_group_ids = [aws_security_group.eks_cluster.id]

    subnet_ids = [
      aws_subnet.private-1a.id,
      aws_subnet.private-1b.id,
    ]
  }

  # CIDR block to assign Kubernetes pod and service IP addresses from. If you don't specify a block, 
  # Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks. 
  # We recommend that you specify a block that does not overlap with resources in other networks that 
  # are peered or connected to your VPC.
  kubernetes_network_config {
    service_ipv4_cidr = var.service_ipv4_cidr
  }

  enabled_cluster_log_types = ["api", "audit"]

  depends_on = [
    aws_iam_role.eks_role,
  ]
}

resource "aws_cloudwatch_log_group" "eks_cluster" {
  name              = "/aws/eks/${aws_eks_cluster.demo.name}/cluster"
  retention_in_days = 7
}