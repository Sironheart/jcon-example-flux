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
    context = "docker-desktop"
  }

  git = {
    url = "ssh://git@github.com/${var.github_org}/${var.github_repository}.git"

    ssh = {
      private_key = "~/.ssh/id_ed25519"
    }
  }
}