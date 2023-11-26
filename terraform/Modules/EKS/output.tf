output "endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}


# output "oidc_provider_issuer" {
#   value       = aws_eks_cluster.this.identity[0].oidc[0].issuer

# }


# output "oidc_provider" {
#   description = "OIDC without https:// "
#   value       = split("https://", aws_eks_cluster.this.identity[0].oidc[0].issuer)[1]
# }
