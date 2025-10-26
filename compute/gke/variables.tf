variable "project_name" {
  description = "The name of the project to which resources will be associated."
  type        = string
}

variable "project_id" {
  description = "The ID of the GCP project where resources will be created."
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster will be created."
  type        = string
  default     = "us-central1"
}
variable "machine_type" {
  description = "The machine type to use for the GKE node pool."
  type        = string
  default     = "e2-medium"
}
variable "node_count" {
  description = "The number of nodes in the GKE node pool."
  type        = number
  default     = 3
}
