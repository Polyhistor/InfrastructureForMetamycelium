resource "kubernetes_secret" "kiali" {
  metadata {
    name      = "kiali"
    namespace = kubernetes_namespace.istio_system.metadata[0].name
  }

  data = {
    username   = "YWRtaW4=" # base64 encoded 'admin'
    passphrase = "YWRtaW4=" # base64 encoded 'admin'
  }

  type = "Opaque"
}
