// This is a filter that is applied to envoy proxy to make external authorizer api use OPA on through grCP ( note target_uri )

resource "k8s_networking_istio_io_envoy_filter_v1alpha3" "minimal" {
  metadata = {
    name      = "ext-authz"
    namespace = "istio-system"
  }

  spec = {
    config_patches = [{
      apply_to = "HTTP_FILTER"
      match = {
        context = "SIDECAR_INBOUND"
        listener = {
          filter_chain = {
            filter = {
              name = "envoy.filters.network.http_connection_manager"
              sub_filter = {
                name = "envoy.filters.http.router"
              }
            }
          }
        }
      }
      patch = {
        operation = "INSERT_BEFORE"
        value = {
          name = "envoy.ext_authz"
          typed_config = {
            "@type"               = "type.googleapis.com/envoy.extensions.filters.http.ext_authz.v3.ExtAuthz"
            transport_api_version = "V3"
            status_on_error = {
              code = "ServiceUnavailable"
            }
            with_request_body = {
              max_request_bytes     = 8192
              allow_partial_message = true
            }
            grpc_service = {
              google_grpc = {
                target_uri  = "127.0.0.1:9191"
                stat_prefix = "ext_authz"
              }
            }
          }
        }
      }
    }]
  }
}


resource "kubernetes_secret" "opa_istio_cert" {
  metadata {
    name      = "server-cert"
    namespace = "opa-istio"
  }

  data = {
    tls.crt = file("${path.module / certificates / tls.cert}")
    tls.key = file("${path.module / certificates / tls.key}")
  }
}



