resource "kubernetes_role_binding" "jenkins_role_binding" {
  metadata {
    name      = "jenkins-role-binding"
    namespace = "jenkins-ns"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "jenkins-role"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "jenkins-admin"
    namespace = "jenkins-ns"
  }
}
