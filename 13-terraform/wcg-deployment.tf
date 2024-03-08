resource "kubernetes_deployment" "app_word_cloud_generator" {
  metadata {
    name = var.names_res_kub.deployment 

    labels = {
      app = var.labels
    }
  }

  spec {
    selector {
      match_labels = {
        app = var.labels
      }
    }

    template {
      metadata {
        labels = {
          app = var.labels
        }
      }

      spec {
        container {
          name  = "wcg"
          image = "ghcr.io/malec0101/wcg:latest"

          port {
            container_port = var.spec_container.target_port
          }
        }
      }
    }
  }
}
