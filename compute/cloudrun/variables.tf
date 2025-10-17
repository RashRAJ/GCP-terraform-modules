variable "environment_variables" {
  description = "A map of environment variables to set in the container."
  type        = map(string)
  default     = {}
}
variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}
variable "location" {
  description = "The location of the Cloud Run service."
  type        = string
  default     = "us-central1"
}
variable "project_id" {
  description = "The ID of the project in which the Cloud Run service will be created."
  type        = string
}
variable "container_image" {
  description = "The container image to deploy."
  type        = string
}
variable "container_name" {
  description = "The name of the container."
  type        = string
  default     = "app"
}
variable "container_port" {
  description = "The port the container listens on."
  type        = number
  default     = 8080
}
variable "resource_limits" {
  description = "The resource limits for the container."
  type        = object({
    cpu    = string
    memory = string
  })
  default = {
    cpu    = "1000m"
    memory = "128Mi"
  }
}