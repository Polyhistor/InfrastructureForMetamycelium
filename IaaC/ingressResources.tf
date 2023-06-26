resource "kubernetes_ingress_v1" "kafka_rest_proxy_ingress" {
  metadata {
    # name = "kafka-rest-proxy-ingress"
    # annotations = {
    #   "nginx.ingress.kubernetes.io/rewrite-target" = "/$2"
    # }
  }
  spec {
    ingress_class_name = "nginx"

    rule {
      host = "keycloak.127.0.0.1.nip.io"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "keycloak"
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
  wait_for_load_balancer = false
}
