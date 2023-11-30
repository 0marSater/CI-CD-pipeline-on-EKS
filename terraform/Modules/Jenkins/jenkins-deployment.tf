resource "kubernetes_deployment" "jenkins_deployment" {
  metadata {
    name      = "jenkins-deployment"
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
        service_account_name = "jenkins-admin"
        container {
          name  = "jenkins"
          image = "jenkins/jenkins:lts"
          security_context {
            # fs_group = 1000
            run_as_user  = 0
            privileged = true
          }
          port {
            container_port = 8080
          }
          port {
            container_port = 50000

          }

          volume_mount {
            name      = "jenkins-vol"
            mount_path = "/var/jenkins_home"
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
