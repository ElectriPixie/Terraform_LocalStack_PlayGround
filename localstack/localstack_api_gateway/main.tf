# File: localstack_api_gateway.tf

# Define the API Gateway container
resource "docker_container" "localstack_api_gateway" {
  name       = "localstack-api-gateway"
  image      = "localstack/localstack"
  ports {
    internal = 4569
    external = 4569
  }
}