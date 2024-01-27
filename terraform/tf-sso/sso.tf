# Groups 
resource "aws_identitystore_group" "developers" {
  display_name      = "developers"
  description       = "Cluster Developers"
  identity_store_id = "d-9067f2337d"
}

resource "aws_identitystore_group" "admins" {
  display_name      = "admins"
  description       = "Cluster Admins"
  identity_store_id = "d-9067f2337d"
}

# Users
resource "aws_identitystore_user" "joao_santos" {
  identity_store_id = "d-9067f2337d"

  display_name = "Joao Santos"
  user_name    = "joaosantos"

  name {
    given_name  = "Joao"
    family_name = "Santos"
  }

  emails {
    value = "emmanuelframos@gmail.com"
  }
}

# Membership
resource "aws_identitystore_group_membership" "example" {
  identity_store_id = "d-9067f2337d"
  group_id          = aws_identitystore_group.developers.group_id
  member_id         = aws_identitystore_user.joao_santos.user_id
}