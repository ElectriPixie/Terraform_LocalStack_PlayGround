# File: localstack_dynamodb.tf

# Define the DynamoDB container
resource "docker_container" "localstack_dynamodb" {
  name       = "localstack-dynamodb"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    #external = 4569
  }
  env = merge(var.service_endpoints, var.environment)
  hostname="dynamodb"
  networks_advanced {
    name = var.network_name  
  }
}