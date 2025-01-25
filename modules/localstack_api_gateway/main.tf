# File: localstack_api_gateway.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint list
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints :
    key => value if !contains(var.skip_endpoint, key)
  })
}


# Define the API Gateway container
resource "docker_container" "localstack_api_gateway" {
  name       = "localstack-api-gateway"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    #external = 4567
  }
  env = flatten([
    for key, value in merge(local.service_endpoints_without_skip, var.environment) : 
    "${key}=${value}"
  ])
  hostname = "apigateway"
  networks_advanced {
    name = var.network_name  
  }
}