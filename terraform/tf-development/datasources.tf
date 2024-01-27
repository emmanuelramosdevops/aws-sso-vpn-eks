data "aws_iam_policy_document" "cluster_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

data "aws_iam_policy_document" "node_policy" {
  statement {
    sid = "1"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

# data "aws_iam_policy_document" "ebs_csi" {

#   statement {
#     actions = [
#       "ec2:ModifyVolume",
#       "ec2:DetachVolume",
#       "ec2:DescribeVolumesModifications",
#       "ec2:DescribeVolumes",
#       "ec2:DescribeTags",
#       "ec2:DescribeSnapshots",
#       "ec2:DescribeInstances",
#       "ec2:DescribeAvailabilityZones",
#       "ec2:CreateSnapshot",
#       "ec2:AttachVolume"
#     ]

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:CreateTags"]

#     condition {
#       test     = "StringLike"
#       variable = "ec2:CreateAction"
#       values = [
#         "CreateVolume",
#         "CreateSnapshot"
#       ]
#     }

#     resources = [
#       "arn:aws:ec2:*:*:volume/*",
#       "arn:aws:ec2:*:*:snapshot/*"
#     ]
#   }

#   statement {
#     actions = ["ec2:DeleteTags"]

#     resources = [
#       "arn:aws:ec2:*:*:volume/*",
#       "arn:aws:ec2:*:*:snapshot/*"
#     ]
#   }

#   statement {
#     actions = ["ec2:CreateVolume"]

#     condition {
#       test     = "StringLike"
#       variable = "aws:RequestTag/ebs.csi.aws.com/cluster"
#       values   = ["true"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:CreateVolume"]
#     condition {
#       test     = "StringLike"
#       variable = "aws:RequestTag/CSIVolumeName"
#       values   = ["*"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:CreateVolume"]
#     condition {
#       test     = "StringLike"
#       variable = "aws:RequestTag/kubernetes.io/cluster/*"
#       values   = ["owned"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:DeleteVolume"]
#     condition {
#       test     = "StringLike"
#       variable = "ec2:ResourceTag/ebs.csi.aws.com/cluster"
#       values   = ["true"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:DeleteVolume"]
#     condition {
#       test     = "StringLike"
#       variable = "ec2:ResourceTag/CSIVolumeName"
#       values   = ["*"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:DeleteVolume"]
#     condition {
#       test     = "StringLike"
#       variable = "ec2:ResourceTag/kubernetes.io/cluster/*"
#       values   = ["owned"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:DeleteSnapshot"]
#     condition {
#       test     = "StringLike"
#       variable = "ec2:ResourceTag/CSIVolumeSnapshotName"
#       values   = ["*"]
#     }

#     resources = ["*"]
#   }

#   statement {
#     actions = ["ec2:DeleteSnapshot"]
#     condition {
#       test     = "StringLike"
#       variable = "ec2:ResourceTag/ebs.csi.aws.com/cluster"
#       values   = ["true"]
#     }

#     resources = ["*"]
#   }
# }


# data "aws_iam_policy_document" "cni_assume_role_policy" {
#   statement {
#     effect  = "Allow"

#     principals {
#             type        = "Federated"
#       identifiers = [aws_iam_openid_connect_provider.oidc_provider.arn]
#     }

#     actions = ["sts:AssumeRoleWithWebIdentity"]

#     condition {
#       test     = "StringEquals"
#       variable = "${replace(aws_iam_openid_connect_provider.oidc_provider.url, "https://", "")}:aud"
#       values   = ["sts.amazonaws.com"]
#     }

#     condition {
#       test     = "StringEquals"
#       variable = "${replace(aws_iam_openid_connect_provider.oidc_provider.url, "https://", "")}:sub"
#       values   = ["system:serviceaccount:kube-system:aws-node"]
#     }
#   }
# }

# data "tls_certificate" "cluster" {
#   url = aws_eks_cluster.demo.identity[0].oidc[0].issuer
# }