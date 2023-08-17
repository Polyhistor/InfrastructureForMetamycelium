resource "helm_release" "kafka_ui" {
  name      = "helm-release-name"
  chart     = "charts/kafka-ui"
  namespace = "default"  # Adjust this if you have a specific namespace in mind

  set {
    name  = "yamlApplicationConfigConfigMap.name"
    value = "kafka-ui-configmap"
  }

  set {
    name  = "yamlApplicationConfigConfigMap.keyName"
    value = "config.yml"
  }
}
