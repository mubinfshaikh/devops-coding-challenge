resource "helm_release" "user_management_app" {
  name       = var.chart_name
  chart      = var.chart_path
  namespace  = var.namespace
  values = [
    yamlencode({
      image = {
        repository = split(":", var.image)[0]
        tag        = split(":", var.image)[1]
      }
      replicaCount = var.replicas
    })
  ]

  recreate_pods = true
  cleanup_on_fail = true
}


