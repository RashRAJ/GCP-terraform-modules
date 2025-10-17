variable "instance_name" {
  description = "The name of the instance."
  type        = string
}

variable "machine_type" {
  description = "The machine type to create."
  type        = string
  default     = "e2-medium"
}
variable "zone" {
  description = "The zone to deploy the instance in."
  type        = string
  default     = "us-central1-a"
}
variable "region" {
  description = "The region to deploy the instance in."
  type        = string
  default     = "us-central1"
}
variable "project_id" {
  description = "The ID of the project in which the instance will be created."
  type        = string
}
variable "boot_image" {
  description = "The boot image to use for the instance."
  type        = string
  default     = "projects/debian-cloud/global/images/family/debian-11"
}   
variable "network" {
  description = "The network to attach to the instance."
  type        = string
  default     = "default"
}

variable "labels" {
  description = "A map of labels to assign to the instance."
  type        = map(string)
  default     = {}
}