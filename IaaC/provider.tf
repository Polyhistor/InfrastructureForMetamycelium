terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    keycloak = {
      source  = "mrparkers/keycloak"
      version = ">= 4.0.0"
    }

  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Path to your kubeconfig file
  }
}

