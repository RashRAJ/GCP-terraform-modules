variable "cluster_name" {
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
variable "x86machine_type" {
  description = "The machine type to use for the GKE node pool."
  type        = string
  default     = "e2-medium"
}
variable "x86node_count" {
  description = "The number of nodes in the x86 node pool."
  type        = number
  default     = 1
}
variable "arm_node_count" {
  description = "The number of nodes in the ARM64 node pool."
  type        = number
  default     = 1
}
variable "create_x86_pool" {
  description = "Whether to create the x86 node pool."
  type        = bool
  default     = true
}
variable "create_arm64_pool" {
  description = "Whether to create the ARM64 node pool."
  type        = bool
  default     = false
}
variable "arm_machine_type" {
  description = "The machine type to use for the ARM64 GKE node pool."
  type        = string
  default     = "t2a-standard-2"
}
variable "network" {
  description = "The VPC network name for the GKE cluster."
  type        = string
}
variable "subnetwork" {
  description = "The subnetwork name for the GKE cluster."
  type        = string
}
