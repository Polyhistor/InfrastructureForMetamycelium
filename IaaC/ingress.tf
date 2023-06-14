
resource "helm_release" "mm_kubernetes_ingress" {
  name       = "mm_kubernetes_ingress"
  repository = "https://polyhistor.github.io/helmChartsRepoForMetamycelium/kubernetes_ingress"
  chart      = "kubernetes-ingress"
  version    = "0.2.0"

}

