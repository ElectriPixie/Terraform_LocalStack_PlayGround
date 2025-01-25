# File: localstack_lambda.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint map
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints : 
    key => value if !contains(keys(var.skip_endpoint), key)
  })
}

# Define the Lambda container
resource "docker_container" "localstack_lambda" {
  name       = "localstack-lambda"
  image      = "localstack/localstack"
  ports  {
    internal = 4566
    #external = 4574
  }
  env = flatten([
    for key, value in merge(local.service_endpoints_without_skip, var.environment) : 
    "${key}=${value}"
  ]) 
  hostname="lambda"
  networks_advanced {
    name = var.network_name  
  }
}