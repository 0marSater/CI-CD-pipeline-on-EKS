resource "kubernetes_storage_class" "ebs_sc" {
  metadata {
    name = "ebs-sc"
    # namespace = "jenkins-ns"
  }
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy      = "Retain"
  parameters = {
    type = "gp2"
  }
  volume_binding_mode = "Immediate"
}