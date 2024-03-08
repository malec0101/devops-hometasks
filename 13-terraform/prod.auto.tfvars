names_res_kub = {

  service    = "word-cloud-generator-svc"
  ingress    = "word-cloud-generator-ingress"
  deployment = "word-cloud-generator-deployment"

}

labels = "word-cloud-generator" # in vars.tf  

spec_container = {
    
    name        = "wcg"
    image       = "ghcr.io/malec0101/wcg:latest"
    port        = 80 # for service 
    target_port = 8888 # container port
    protocol    = "TCP"

  }


spec_ingress = {

    host        = "wcg.by"
    path        = "/"
    path_type   = "Prefix"

  }
