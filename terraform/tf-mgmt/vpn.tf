resource "aws_ec2_client_vpn_endpoint" "vpn_eks" {
  description = "Used for accessing access EKS Cluster"

  vpc_id             = var.vpc_id
  client_cidr_block  = var.vpn_cidr_block
  security_group_ids = [aws_security_group.vpn_eks_cluster.id]

  vpn_port              = 443
  transport_protocol    = "udp"
  session_timeout_hours = 8
  split_tunnel          = true

  self_service_portal    = "enabled"
  server_certificate_arn = var.server_certificate_arn

  authentication_options {
    type                           = "federated-authentication"
    saml_provider_arn              = var.vpn_saml_provider_arn
    self_service_saml_provider_arn = var.self_service_saml_provider_arn
  }

  dns_servers = [
    "1.1.1.1",
    "1.0.0.1"
  ]

  connection_log_options {
    enabled              = true
    cloudwatch_log_group = aws_cloudwatch_log_group.vpn_eks_cluster.id
  }

  tags = {
    Name = "client-vpn-eks"
  }
}

resource "aws_security_group" "vpn_eks_cluster" {
  name        = "vpn-eks"
  description = "VPN EKS Cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-vpn-eks"
  }
}

resource "aws_cloudwatch_log_group" "vpn_eks_cluster" {
  name              = "/vpn/eks-cluster"
  retention_in_days = 30
}