resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}



resource "kubernetes_namespace" "istio_service_mesh" {
  metadata {
    name = "istio-service-mesh"
    labels = {
      "istio-injection" = "true"
    }
  }
}


resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  namespace  = kubernetes_namespace.istio_system.metadata[0].name

  depends_on = [helm_release.istiod]
}
