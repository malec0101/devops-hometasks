variable "names_res_kub" {
  
  type = object({
    service    = string
    ingress    = string
    deployment = string
  })
}

variable "labels" {
  type         = string
  default      = "word-cloud-generator"
}

variable "spec_container" {
  type = object({
    name        = string
    image       = string
    port        = number
    target_port = number
    protocol    = string
  })
}

variable "spec_ingress" {
  type = object({
    host        = string
    path        = string
    path_type   = string
  })
}

variable "tf_token" {}
