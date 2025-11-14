output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "endpoint_ip" {
  value       = google_compute_address.endpoint_ip.address
  description = "Static IP address for the GKE Ingress"
}

output "token" {
  value       = google_container_cluster.primary.master_auth[0].token
  description = "Kubernetes authentication token"
}

output "cluster_ca_certificate" {
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  description = "Kubernetes cluster CA certificate"
}