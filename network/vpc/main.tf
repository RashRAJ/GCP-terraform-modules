resource "google_compute_network" "vpc" {
  name                    = "${var.vpc_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.vpc_name}-subnet"
  ip_cidr_range = "${var.subnet_cidr}"
  region        = var.region
  network       = google_compute_network.vpc.name

    secondary_ip_range {
        range_name    = "pods"
        ip_cidr_range = "${var.pods_cidr}"
    }
    secondary_ip_range {
        range_name    = "services"
        ip_cidr_range = "${var.services_cidr}"
    }
}