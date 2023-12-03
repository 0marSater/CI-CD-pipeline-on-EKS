resource "kubernetes_service_account" "jenkins_sa" {
  metadata {
    name = "jenkins-admin"
    namespace = "jenkins-ns"
  }
}

resource "kubernetes_role" "jenkins_role" {
  metadata {
    name = "jenkins-role"
    namespace = "jenkins-ns"
  }

  rule {
    api_groups     = [""]
    resources      = ["pods"]
    verbs          = ["create","delete","get","list","patch","update","watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["pods/exec"]
    verbs      = ["create","delete","get","list","patch","update","watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["pods/log"]
    verbs      = ["get","list","watch"]
  }
  
  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["get"]
  }
}


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

