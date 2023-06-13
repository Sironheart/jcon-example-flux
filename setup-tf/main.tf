resource "github_repository_deploy_key" "deploy_key" {
  title      = "Flux"
  repository = var.github_repository
  key        = tls_private_key.flux.public_key_openssh
  read_only  = "false"
}

resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "flux_bootstrap_git" "cluster" {
  depends_on = [github_repository_deploy_key.deploy_key]

  path = "cluster/${var.env}"
}
