# File: localstack_lambda.tf

# Define the Lambda container
resource "docker_container" "localstack_lambda" {
  name       = "localstack-lambda"
  image      = "localstack/localstack"
  ports  {
    internal = 4566
    #external = 4574
  }
  hostname="lambda"
  networks_advanced {
    name = var.network_name  
  }
  env = ["SERVICES=lambda"]
}