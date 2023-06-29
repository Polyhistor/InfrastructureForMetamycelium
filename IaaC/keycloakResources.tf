resource "kubernetes_service" "keycloak" {
  metadata {
    name = "keycloak"
    labels = {
      app = "keycloak"
    }
  }
  spec {
    selector = {
      app = "keycloak"
    }
    port {
      name        = "http"
      port        = 8080
      target_port = 8080
      node_port   = 30080 # Choose an available port in the NodePort range (30000-32767)
    }

    type = "NodePort"
  }
}


resource "kubernetes_deployment" "keycloak" {
  metadata {
    name = "keycloak"
    labels = {
      app = "keycloak"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "keycloak"
      }
    }

    template {
      metadata {
        labels = {
          app = "keycloak"
        }
      }

      spec {
        container {
          image = "quay.io/keycloak/keycloak:21.1.1"
          name  = "keycloak"
          args  = ["start-dev"]

          env {
            name  = "KEYCLOAK_ADMIN"
            value = "admin"
          }

          env {
            name  = "KEYCLOAK_ADMIN_PASSWORD"
            value = "admin"
          }

          env {
            name  = "PROXY_ADDRESS_FORWARDING"
            value = "true"
          }

          # env {
          #   name  = "KC_HOSTNAME"
          #   value = "localhost"
          # }

          # env {
          #   name  = "KC_PROXY"
          #   value = "edge"
          # }

          env {
            name  = "KEYCLOAK_FRONTEND_URL"
            value = "http://localhost:8080/auth"
          }

          port {
            name           = "http"
            container_port = 8080
          }
        }
      }
    }
  }
}
