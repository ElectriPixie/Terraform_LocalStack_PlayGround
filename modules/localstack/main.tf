# File: localstack.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint list
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints :
    key => value if !contains(var.skip_endpoint, key)
  })
  services_map = length(var.services) > 0 ? {
    "SERVICES" = join(",", var.services)
  } : {}
}

# Define the LocalStack image
resource "docker_image" "localstack" {
  name = "localstack/localstack"
}

# Define the main LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = docker_image.localstack.name
  ports {
    internal = 4566
    external = 4566
  }
  hostname = "localstack"
  networks_advanced {
    name = var.network_name  
  } 

  env = flatten([
    #I feel like maybe I could be doing this better
    for key, value in merge(local.service_endpoints_without_skip, var.environment, var.environment_root, local.services_map) : 
    "${key}=${value}"
  ])
}
