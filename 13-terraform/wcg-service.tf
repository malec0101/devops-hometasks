resource "kubernetes_service" "word_cloud_generator_service" {
  metadata {

    name = var.names_res_kub.service

    labels = {
      app = var.labels
    }
  }

  spec {
    port {
      protocol    = var.spec_container.protocol
      port        = var.spec_container.port
      target_port = var.spec_container.target_port
    }

    selector = {
      app = var.labels
    }
  }
}
