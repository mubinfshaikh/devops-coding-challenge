provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "helm_release" "user_management" {
  name       = "user-management"
  chart      = "./user-management"
  namespace  = "default"

  values = [
    file("./user-management/values.yaml")
  ]
}
