# File: localstack_s3.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint map
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints : 
    key => value if !contains(keys(var.skip_endpoint), key)
  })
}

# Define the S3 container
resource "docker_container" "localstack_s3" {
  name       = "localstack-s3"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    #external = 4572
  }
   env = flatten([
    for key, value in merge(local.service_endpoints_without_skip, var.environment) : 
    "${key}=${value}"
  ])  
  hostname = "s3"
  networks_advanced {
    name = var.network_name  
  }
}