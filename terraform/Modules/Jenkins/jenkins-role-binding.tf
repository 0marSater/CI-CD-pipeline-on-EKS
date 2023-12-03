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

# apiVersion: rbac.authorization.k8s.io/v1
# kind: RoleBinding
# metadata:
#   name: jenkins-role-binding
#   namespace: devops-tools
# roleRef:
#   apiGroup: rbac.authorization.k8s.io
#   kind: Role
#   name: jenkins
# subjects:
# - kind: ServiceAccount
#   name: jenkins-admin
#   namespace: devops-tools