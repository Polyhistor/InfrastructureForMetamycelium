resource "kubernetes_service_account" "kiali" {
  metadata {
    name      = "kiali"
    namespace = kubernetes_namespace.istio_system.metadata[0].name
  }

  automount_service_account_token = true
}
