# File: localstack_api_gateway.tf

# Define the API Gateway container
resource "docker_container" "localstack_api_gateway" {
  name       = "localstack-api-gateway"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    external = 4566
  }
  env = ["SERVICES=apigateway"]
  hostname = "apigateway"
  networks_advanced {
    name = var.network_name  
  }
}