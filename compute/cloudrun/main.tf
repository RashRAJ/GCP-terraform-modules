resource "google_cloud_run_service" "this" {
    name     = var.service_name
    location = var.location
    project  = var.project_id
    
    template {
        spec {
        containers {
            image = var.container_image
            name  = var.container_name
            ports {
            container_port = var.container_port
            }
    
            resources {
            limits = var.resource_limits
            }
    
            dynamic "env" {
            for_each = var.environment_variables
            content {
                name  = env.key
                value = env.value
            }
            }
        }
        }
    }
    
    traffic {
        percent         = 100
        latest_revision = true
    }
      
}