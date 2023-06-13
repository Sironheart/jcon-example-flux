terraform {
  required_version = ">= 1.0.0"
  required_providers {
    flux = {
      source = "fluxcd/flux"
      version = "1.0.0-rc.5"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.21.1"
    }
    github = {
      source  = "integrations/github"
      version = ">=5.18.0"
    }
  }
}