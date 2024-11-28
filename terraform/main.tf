terraform {
  required_version = ">= 1.3.0"
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "helm_deployment" {
  source      = "./modules/helm-deployment"
  chart_name  = var.chart_name
  chart_path  = var.chart_path # Path to your Helm chart
  namespace   = var.namespace
  image       = var.image # Image to be pulled
  replicas    = var.replicas

}

