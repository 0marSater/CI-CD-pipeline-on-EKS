resource "kubernetes_service" "jenkins_http" {
  metadata {
    name      = "jenkins-service"
    namespace = "jenkins-ns"
  }
  spec {
    selector = {
      app = kubernetes_deployment.jenkins_deployment.metadata.0.labels.app
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


resource "kubernetes_service" "jenkins_jnlp" {
  metadata {
    name      = "jenkins-jnlp-service"
    namespace = "jenkins-ns"

  }
  spec {
    selector = {
      app = kubernetes_deployment.jenkins_deployment.metadata.0.labels.app
    }
    port {
      port        = 50000
      target_port = 50000
    }

    type = "ClusterIP"
  }
}
