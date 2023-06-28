resource "kubernetes_ingress_v1" "kafka_rest_proxy_ingress" {
  metadata {
    name = "kafka-rest-proxy-ingress"
    # annotations = {
    #   "nginx.ingress.kubernetes.io/rewrite-target" = "/$2"
    # }
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = "localhost"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "kafka-rest-proxy"
              port {
                number = 8082
              }
            }
          }
        }


        # path {
        #   path      = "/kafka-rest-proxy"
        #   path_type = "Prefix"
        #   backend {
        #     service {
        #       name = "kafka-rest-proxy"
        #       port {
        #         number = 8080
        #       }
        #     }
        #   }
        # }

      }
    }
  }
  wait_for_load_balancer = false
}
