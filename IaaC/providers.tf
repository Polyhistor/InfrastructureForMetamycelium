terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Path to your kubeconfig file
  }
}

# provider "kubernetes" {
#   config_path    = "~/.kube/config" # Path to your kubeconfig file
#   config_context = "minikube"       # Context name for Minikube cluster
# }

resource "helm_release" "mm_kubernetes_ingress" {
  name       = "mm"
  repository = "https://polyhistor.github.io/helmChartsRepoForMetamycelium/kubernetes_ingress"
  chart      = "kubernetes_ingress"
  version    = "0.1.0"

  values = [
    <<EOF
serviceAccount:
  create: false
  name: mmServiceAccount
EOF
    // Specify any additional values or overrides for the Helm chart
  ]
}

