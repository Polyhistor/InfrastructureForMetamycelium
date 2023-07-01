# resource "helm_release" "mm_kubernetes_ingress" {
#   name       = "mm-ingress-helm-release"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   chart      = "ingress-nginx"
#   version    = "4.7.0" # ensure you use the correct version here
#   wait       = false
# }

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  set {
    name  = "controller.service.type"
    value = "NodePort"
  }

  set {
    name  = "controller.service.nodePorts.http"
    value = "31293"
  }

  set {
    name  = "controller.hostNetwork"
    value = "true"
  }

}

resource "helm_release" "mm_kafka" {
  name       = "mm-kafka"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kafka"
}

resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"

  set {
    name  = "server.dev.enabled"
    value = "true"
  }

  set {
    name  = "ui.enabled"
    value = "true"
  }
}

resource "helm_release" "node_temeletry_processor" {
  name       = "mm-telemetry-processor"
  repository = "https://polyhistor.github.io/helmChartsRepoForMetamycelium/nodejs-telemetry-processor"
  chart      = "mm-telemetry-processor"
}
