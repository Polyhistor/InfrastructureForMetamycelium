resource "kubernetes_ingress_v1" "kafka_rest_proxy_ingress" {
  metadata {
    name = "kafka-rest-proxy-ingress"
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path = "/"
          backend {
            service {
              name = "kafka-rest-proxy" # reference the service you've declared
              port {
                number = 8082
              }
            }
          }
        }
      }
    }
  }
  wait_for_load_balancer = false
}
