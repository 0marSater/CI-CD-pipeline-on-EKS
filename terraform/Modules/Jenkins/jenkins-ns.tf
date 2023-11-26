resource "kubernetes_namespace" "jenkins_ns" {
  metadata {
    name = "jenkins-ns"
  }
}