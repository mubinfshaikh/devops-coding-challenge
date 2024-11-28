variable "chart_name" {
  description = "The name of the Helm release"
  type        = string
  default     = "user-management-app"
}

variable "chart_path" {
  description = "The path to the Helm chart"
  type        = string
  default     = "../charts"
}

variable "namespace" {
  description = "The Kubernetes namespace for the release"
  default     = "development"
  type        = string
}

variable "image" {
  description = "Docker image to pull from the registry"
  default     = "mubinahmed/user-management:latest"
  type        = string
}

variable "replicas" {
  description = "Number of replicas for the deployment"
  type        = number
  default     = 1
}
