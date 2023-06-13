provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

provider "github" {
  owner = var.github_org
  token = var.github_token
}

provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }

  git = {
    url = "ssh://git@github.com/${var.github_org}/${var.github_repository}.git"

    ssh = {
      username = "git"
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}