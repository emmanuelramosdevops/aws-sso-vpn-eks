#resource "aws_eks_addon" "kube-proxy" {
#  cluster_name                = aws_eks_cluster.demo.name
#  addon_name                  = "kube-proxy"
#  addon_version               = "v1.24.17-eksbuild.3"
#  resolve_conflicts_on_create = "OVERWRITE"
#}
#
#resource "aws_eks_addon" "coredns" {
#  cluster_name                = aws_eks_cluster.demo.name
#  addon_name                  = "coredns"
#  addon_version               = "v1.9.3-eksbuild.10"
#  resolve_conflicts_on_create = "OVERWRITE"
#}

# resource "aws_eks_addon" "aws-ebs-csi-driver" {
#   cluster_name = aws_eks_cluster.demo.name
#   addon_name   = "aws-ebs-csi-driver"
# }

# resource "aws_eks_addon" "vpc-cni" {
#   cluster_name             = aws_eks_cluster.demo.name
#   addon_name               = "vpc-cni"
#   addon_version = "v1.15.4-eksbuild.1"
#   resolve_conflicts_on_create = "OVERWRITE"

#   service_account_role_arn = aws_iam_role.cniRole.arn
# }

# resource "aws_iam_role" "cniRole" {
#   assume_role_policy = data.aws_iam_policy_document.cni_assume_role_policy.json
#   name               = "cniRole"
# }

# resource "aws_iam_openid_connect_provider" "oidc_provider" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = [data.tls_certificate.cluster.certificates[0].sha1_fingerprint]
#   url             = aws_eks_cluster.demo.identity[0].oidc[0].issuer
# }

# resource "aws_iam_role_policy_attachment" "example" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.cniRole.name
# }