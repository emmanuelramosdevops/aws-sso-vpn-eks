variable "vpn_cidr_block" {}
variable "server_certificate_arn" {}
variable "vpn_saml_provider_arn" {}
variable "self_service_saml_provider_arn" {}

variable "sso_admins_group_id" {}
variable "sso_devs_group_id" {}

variable "vpc_id" {}
variable "vpc_net_cidr" {}
variable "vpc_dev_cidr" {}
variable "vpc_private_subnet_1a" {}
variable "vpc_private_subnet_1b" {}