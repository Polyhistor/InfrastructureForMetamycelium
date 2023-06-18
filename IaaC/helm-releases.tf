resource "helm_release" "mm_kubernetes_ingress" {
  name       = "mm-ingress-helm-release"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.7.0" # ensure you use the correct version here
  wait       = false
}

resource "helm_release" "mm_kafka" {
  name       = "mm-kafka"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kafka"
}

resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"

  set {
    name  = "server.dev.enabled"
    value = "true"
  }

  set {
    name  = "ui.enabled"
    value = "true"
  }
}

resource "helm_release" "keycloak" {
  name       = "keycloak"
  repository = "https://codecentric.github.io/helm-charts"
  chart      = "keycloak"
  version    = "18.4.3" # specify the version here

  set {
    name  = "keycloak.username"
    value = "keycloak"
  }

  set {
    name  = "keycloak.password"
    value = "password"
  }

  set {
    name  = "postgresql.postgresqlPassword"
    value = "password"
  }

  set {
    name  = "postgresql.postgresqlUsername"
    value = "bn_keycloak"
  }

  set {
    name  = "postgresql.postgresqlDatabase"
    value = "keycloak"
  }
}
