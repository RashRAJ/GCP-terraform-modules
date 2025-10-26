variable "vpc_name" {
  description = "The name of the project to which resources will be associated."
  type        = string  
  
}

variable "project_id" {
  description = "The ID of the GCP project where resources will be created."
  type        = string
}
variable "region" {
  description = "The region where the VPC and subnet will be created."
  type        = string
  default     = "us-central1"
}
variable "subnet_cidr" {
  description = "The CIDR range for the primary IP range of the subnet."
  type        = string
  default     = "[ 10.0.0.0/24 ]"
}
variable "pods_cidr" {
  description = "The CIDR range for the pods secondary IP range of the subnet."
  type        = string
  default     = " 10.0.0.0/16 "
}
variable "services_cidr" {
  description = "The CIDR range for the services secondary IP range of the subnet."
  type        = string
  default     = " 10.0.0.0/20 "
}   