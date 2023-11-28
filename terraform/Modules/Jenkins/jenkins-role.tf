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

# apiVersion: rbac.authorization.k8s.io/v1
# kind: Role
# metadata:
#   name: jenkins
#   namespace: jenkins-ns
#   labels:
#     "app.kubernetes.io/name": 'jenkins'
# rules:
# - apiGroups: [""]
#   resources: ["pods"]
#   verbs: ["create","delete","get","list","patch","update","watch"]
# - apiGroups: [""]
#   resources: ["pods/exec"]
#   verbs: ["create","delete","get","list","patch","update","watch"]
# - apiGroups: [""]
#   resources: ["pods/log"]
#   verbs: ["get","list","watch"]
# - apiGroups: [""]
#   resources: ["secrets"]
#   verbs: ["get"]