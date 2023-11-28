resource "kubernetes_secret" "jenkins_secret" {
  metadata {
    name      = "my-registery-key"
    namespace = "jenkins-ns"
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "https://index.docker.io/v1/" = {
          "username" = "omarsater"
          "password" = "dckr_pat_NT57swECifLHxNT9yFBH372copU"
          "email"    = "omar.buis22@gmail.com"
          "auth"     = base64encode("omarsater:dckr_pat_NT57swECifLHxNT9yFBH372copU")
        }
      }
    })
  }
}
