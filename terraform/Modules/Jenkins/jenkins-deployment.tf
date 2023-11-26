resource "kubernetes_deployment" "jenkins_deployment" {
  metadata {
    name      = "jenkins"
    namespace = "jenkins-ns"
    labels    = {
      app = "jenkins-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "jenkins-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins-app"
        }
      }

      spec {
        container {
          name  = "jenkins"
          image = "jenkins/jenkins:lts"

          port {
            container_port = 8080
          }
          port {
            container_port = 50000

          }

          volume_mount {
            name      = "jenkins-vol"
            mount_path = "/var/jenkins_vol"
          }
        }

        volume {
          name = "jenkins-vol"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.jenkins_vol.metadata[0].name
          }
        }
      }
    }
  }
}
