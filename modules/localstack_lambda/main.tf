# File: localstack_lambda.tf

# Define the Lambda container
resource "docker_container" "localstack_lambda" {
  name       = "localstack-lambda"
  image      = "localstack/localstack"
  ports  {
    internal = 4568
    external = 4568
  }
  hostname="lambda"
  networks_advanced {
    name = var.network_name  
  }
  command = [
    "localstack",
    "start",
    "--services",
    "aws_lambda",
  ]
}