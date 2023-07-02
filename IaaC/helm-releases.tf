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

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = "localhost"
  }
}


resource "helm_release" "node_temeletry_processor" {
  name       = "mm-telemetry-processor"
  repository = "https://polyhistor.github.io/helmChartsRepoForMetamycelium/nodejs-telemetry-processor"
  chart      = "mm-telemetry-processor"
}

resource "helm_release" "istio_base" {
  name  = "istio-base"
  chart = "base"

  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name

  set {
    name  = "defaultRevision"
    value = "default"
  }

  depends_on = [kubernetes_namespace.istio_system]
}

resource "helm_release" "istiod" {
  name  = "istiod"
  chart = "istiod"

  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name
  depends_on = [helm_release.istio_base]
}

