resource "kubernetes_persistent_volume_claim" "jenkins_vol" {
  metadata {
    name = "jenkins-vol"
    namespace = "jenkins-ns"

  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "15Gi"
      }
    }
    storage_class_name = kubernetes_storage_class.ebs_sc.metadata[0].name  
  }
}

