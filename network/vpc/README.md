# VPC Module

This Terraform module creates a Google Cloud VPC network with a subnet and secondary IP ranges for GKE pods and services.

## Resources Created

- **VPC Network**: A custom VPC network with auto-create subnetworks disabled
- **Subnet**: A regional subnet with primary and secondary IP ranges
  - Primary IP range for VM instances
  - Secondary IP range for Kubernetes pods
  - Secondary IP range for Kubernetes services

## Usage

```hcl
module "vpc" {
  source = "./network/vpc"

  vpc_name      = "my-vpc"
  project_id    = "my-gcp-project"
  region        = "us-central1"
  subnet_cidr   = "10.0.0.0/24"
  pods_cidr     = "10.1.0.0/16"
  services_cidr = "10.2.0.0/20"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_name | The name of the VPC | `string` | - | yes |
| project_id | The ID of the GCP project where resources will be created | `string` | - | yes |
| region | The region where the VPC and subnet will be created | `string` | `us-central1` | no |
| subnet_cidr | The CIDR range for the primary IP range of the subnet | `string` | `[ 10.0.0.0/24 ]` | no |
| pods_cidr | The CIDR range for the pods secondary IP range of the subnet | `string` | ` 10.0.0.0/16 ` | no |
| services_cidr | The CIDR range for the services secondary IP range of the subnet | `string` | ` 10.0.0.0/20 ` | no |

## Outputs

| Name | Description |
|------|-------------|
| network_name | The name of the VPC network |
| subnet_name | The name of the subnet |
| network_self_link | The self link of the VPC network |
| subnet_self_link | The self link of the subnet |

## Notes

- The VPC is created with `auto_create_subnetworks = false` for explicit subnet control
- Secondary IP ranges are configured for GKE workloads (pods and services)
- Ensure CIDR ranges don't overlap with existing networks
