resource "kubernetes_ingress_v1" "minimal_ingress" {
  metadata {
    name = var.names_res_kub.ingress

    labels = {
      app = var.labels
    }

    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = var.spec_ingress.host

      http {
        path {
          path      = var.spec_ingress.path
          path_type = var.spec_ingress.path_type

          backend {
            service {
              name = var.names_res_kub.service

              port {
                number = var.spec_container.port
              }
            }
          }
        }
      }
    }
  }
}
