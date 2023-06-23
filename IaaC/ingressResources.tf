resource "kubernetes_ingress" "kafka_rest_proxy_ingress" {
  metadata {
    name = "kafka-rest-proxy-ingress"
  }
  spec {
    rule {
      host = "kafka-rest-proxy.your-domain.com" # replace with your desired host
      http {
        path {
          path = "/"
          backend {
            service_name = "kafka-rest-proxy"
            service_port = 8082
          }
        }
      }
    }
  }
}
