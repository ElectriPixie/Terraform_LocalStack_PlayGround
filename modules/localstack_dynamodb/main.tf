# File: localstack_dynamodb.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint map
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints : 
    key => value if !contains(keys(var.skip_endpoint), key)
  })
}

# Define the DynamoDB container
resource "docker_container" "localstack_dynamodb" {
  name       = "localstack-dynamodb"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    #external = 4569
  }
  env = flatten([
    for key, value in merge(local.service_endpoints_without_skip, var.environment) : 
    "${key}=${value}"
  ]) 
  hostname="dynamodb"
  networks_advanced {
    name = var.network_name  
  }
}