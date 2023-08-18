resource "kubernetes_config_map" "kafka_ui_configmap" {
  metadata {
    name = "kafka-ui-configmap"
  }

  data = {
    "config.yml" = <<-EOT
      kafka:
        clusters:
          - name: yaml
            bootstrapServers: kafka-cluster-broker-endpoints:9092
      auth:
        type: disabled
      management:
        health:
          ldap:
            enabled: false
    EOT
  }
}
