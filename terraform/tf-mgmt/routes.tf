# Development VPC
resource "aws_ec2_client_vpn_route" "dev_vpc_private1a" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  destination_cidr_block = var.vpc_dev_cidr
  target_vpc_subnet_id   = var.vpc_private_subnet_1a
}

resource "aws_ec2_client_vpn_route" "dev_vpc_private1b" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  destination_cidr_block = var.vpc_dev_cidr
  target_vpc_subnet_id   = var.vpc_private_subnet_1b
}

