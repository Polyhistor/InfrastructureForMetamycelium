resource "kubernetes_ingress_v1" "kafka_rest_proxy_ingress" {
  metadata {
    name = "kafka-rest-proxy-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$2"
      "nginx.ingress.kubernetes.io/use-regex"      = "true"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "localhost"
      http {
        path {
          path      = "/kafka-rest-proxy(/|$)(.*)"
          path_type = "ImplementationSpecific"
          backend {
            service {
              name = "kafka-rest-proxy"
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

resource "kubernetes_ingress_v1" "vault_ui_ingress" {
  metadata {
    name = "vault-ui-ingress"
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "localhost"
      http {
        path {
          path = "/vault/*"
          backend {
            service {
              name = "vault-ui"
              port {
                number = 8200
              }
            }
          }
        }
      }
    }
  }
}
