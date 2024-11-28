provider "kubernetes" {
  config_path = "~/.kube/config" # Path to your kubeconfig file (local cluster)
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

