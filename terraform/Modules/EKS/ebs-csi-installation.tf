data "aws_eks_cluster" "my_cluster" {
  name = aws_eks_cluster.this.name
}

data "aws_eks_cluster_auth" "my_cluster" {
  name = aws_eks_cluster.this.name
}


# HELM Provider
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.my_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.my_cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.my_cluster.token
  }
}


resource "helm_release" "ebs_csi_driver" {
  depends_on = [aws_iam_role.ebs_csi_iam_role]
  name       = "aws-ebs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  namespace  = "kube-system"

  set {
    name  = "image.repository"
    value = "602401143452.dkr.ecr.eu-west-1.amazonaws.com/eks/aws-ebs-csi-driver" # Changes based on Region - This is for eu-west-1 Additional Reference: https://docs.aws.amazon.com/eks/latest/userguide/add-ons-images.html
  }

  set {
    name  = "controller.serviceAccount.create"
    value = "true"
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "ebs-csi-controller-sa"
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.ebs_csi_iam_role.arn
  }

}