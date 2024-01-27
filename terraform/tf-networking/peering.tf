resource "aws_vpc_peering_connection" "net_owner" {
  vpc_id        = aws_vpc.main.id
  peer_vpc_id   = var.development_vpc
  peer_owner_id = var.development_account
  
  tags = {
    Name = "Networking-Development"
  }

  depends_on = [ aws_vpc.main ]
}

resource "aws_vpc_peering_connection_accepter" "dev_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.net_owner.id  

  tags = {
    Name = "Networking-Development"
  }
}