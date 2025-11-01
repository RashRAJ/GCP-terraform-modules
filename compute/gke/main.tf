resource "google_container_cluster" "primary" {
  name     = "${var.cluster_name}-cluster"
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection = false
  network    = var.network
  subnetwork = var.subnetwork
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
  
}

resource "google_container_node_pool" "x86_pool" {
  count      = var.create_x86_pool ? 1 : 0
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.x86node_count

  node_config {
    machine_type = var.x86machine_type
    disk_size_gb = 80
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/logging.write",
    ]
    labels = {
      env = var.project_id
    }
  # preemptible  = true
    tags         = ["gke-node", "${var.cluster_name}-gke"]
    metadata = {
        disable-legacy-endpoints = "true"
    }
  }
}

resource "google_container_node_pool" "arm64_pool" {
  count      = var.create_arm64_pool ? 1 : 0
  name       = "arm64-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.arm_node_count

  node_config {
    machine_type = var.arm_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    tags = ["arm64-node"]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
  
}