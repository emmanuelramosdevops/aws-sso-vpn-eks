resource "aws_ec2_client_vpn_network_association" "private-1a" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  subnet_id              = var.vpc_private_subnet_1a
}

resource "aws_ec2_client_vpn_network_association" "private-1b" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  subnet_id              = var.vpc_private_subnet_1b
}