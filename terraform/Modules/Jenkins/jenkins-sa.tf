resource "kubernetes_service_account" "jenkins_sa" {
  metadata {
    name = "jenkins-admin"
    namespace = "jenkins-ns"
  }
}

# apiVersion: v1
# kind: ServiceAccount
# metadata:
#   name: jenkins-admin
#   namespace: devops-tools