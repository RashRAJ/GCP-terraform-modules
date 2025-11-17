# GKE Terraform Module

This module creates a Google Kubernetes Engine (GKE) cluster with optional x86 and ARM64 node pools.

## Features

- Creates a GKE cluster with configurable settings
- Supports optional x86 node pool
- Supports optional ARM64 node pool
- Uses secondary IP ranges for pods and services
- Removes default node pool for better control
- Configurable node count and machine types

## Usage

### Basic Example with x86 Node Pool

```hcl
module "gke_cluster" {
  source = "./compute/gke"

  cluster_name      = "my-gke-cluster"
  project_id        = "my-gcp-project"
  region            = "us-central1"
  network           = "my-vpc-network"
  subnetwork        = "my-subnet"

  create_x86_pool   = true
  x86machine_type   = "e2-medium"
  x86node_count     = 3
}
```

### Example with ARM64 Node Pool

```hcl
module "gke_cluster" {
  source = "./compute/gke"

  cluster_name       = "my-gke-cluster"
  project_id         = "my-gcp-project"
  region             = "us-west1"
  network            = "my-vpc-network"
  subnetwork         = "my-subnet"

  create_arm64_pool  = true
  arm_machine_type   = "t2a-standard-2"
  arm_node_count     = 2
}
```

### Example with Both Node Pools

```hcl
module "gke_cluster" {
  source = "./compute/gke"

  cluster_name       = "my-gke-cluster"
  project_id         = "my-gcp-project"
  region             = "us-central1"
  network            = "my-vpc-network"
  subnetwork         = "my-subnet"

  create_x86_pool    = true
  x86machine_type    = "e2-standard-4"
  x86node_count      = 3

  create_arm64_pool  = true
  arm_machine_type   = "t2a-standard-4"
  arm_node_count     = 2
}
```

## Requirements

- Terraform >= 0.13
- Google Cloud Platform project with Kubernetes Engine API enabled
- VPC network with secondary IP ranges configured for pods and services

### VPC Secondary IP Ranges

The module expects the subnetwork to have the following secondary IP ranges configured:
- `pods` - For pod IP addresses
- `services` - For service IP addresses

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_name | The name of the GKE cluster | `string` | n/a | yes |
| project_id | The ID of the GCP project where resources will be created | `string` | n/a | yes |
| network | The VPC network name for the GKE cluster | `string` | n/a | yes |
| subnetwork | The subnetwork name for the GKE cluster | `string` | n/a | yes |
| region | The region where the GKE cluster will be created | `string` | `"us-central1"` | no |
| create_x86_pool | Whether to create the x86 node pool | `bool` | `false` | no |
| x86machine_type | The machine type to use for the x86 node pool | `string` | `"e2-medium"` | no |
| x86node_count | The number of nodes in the x86 node pool | `number` | `1` | no |
| create_arm64_pool | Whether to create the ARM64 node pool | `bool` | `false` | no |
| arm_machine_type | The machine type to use for the ARM64 node pool | `string` | `"t2a-standard-2"` | no |
| arm_node_count | The number of nodes in the ARM64 node pool | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| kubernetes_cluster_name | GKE Cluster Name |
| kubernetes_cluster_host | GKE Cluster Host |
| endpoint | GKE Cluster Endpoint |
| cluster_ca_certificate | Kubernetes cluster CA certificate |

## Notes

- The module creates a cluster with `remove_default_node_pool = true` and uses separately managed node pools
- Deletion protection is disabled (`deletion_protection = false`)
- x86 nodes include monitoring and logging OAuth scopes
- ARM64 nodes have auto-repair and auto-upgrade enabled
- x86 nodes use an 80GB disk size

## Example: Connecting to the Cluster

After creating the cluster, you can connect to it using:

```bash
gcloud container clusters get-credentials <cluster_name>-cluster --region <region> --project <project_id>
```
