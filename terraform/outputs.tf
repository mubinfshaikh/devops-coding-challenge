output "release_name" {
  description = "The name of the Helm release"
  value       = module.helm_deployment.release_name
}

output "namespace" {
  description = "Namespace where the deployment is created"
  value       = var.namespace
}
