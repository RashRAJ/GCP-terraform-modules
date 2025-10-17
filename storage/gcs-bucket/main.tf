resource "google_storage_bucket" "this" {
    name = var.bucket_name
    location = var.location
    project = var.project_id
    labels = var.labels
}

