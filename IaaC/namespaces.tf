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
