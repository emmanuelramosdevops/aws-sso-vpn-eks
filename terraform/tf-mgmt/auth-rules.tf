# Networking
resource "aws_ec2_client_vpn_authorization_rule" "net_vpc_admins" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  target_network_cidr    = var.vpc_net_cidr
  access_group_id        = var.sso_admins_group_id
  description            = "admins->net"
}

resource "aws_ec2_client_vpn_authorization_rule" "net_vpc_devs" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  target_network_cidr    =  var.vpc_net_cidr
  access_group_id        = var.sso_devs_group_id
  description            = "devs->net"
}

# Development
resource "aws_ec2_client_vpn_authorization_rule" "dev_vpc_admins" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  target_network_cidr    = var.vpc_dev_cidr
  access_group_id        = var.sso_admins_group_id
  description            = "admins->dev"
}

resource "aws_ec2_client_vpn_authorization_rule" "dev_vpc_devs" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn_eks.id
  target_network_cidr    =  var.vpc_dev_cidr
  access_group_id        = var.sso_devs_group_id
  description            = "devs->dev"
}