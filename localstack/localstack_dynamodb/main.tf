# File: localstack_dynamodb.tf

# Define the DynamoDB container
resource "docker_container" "localstack_dynamodb" {
  name       = "localstack-dynamodb"
  image      = "localstack/localstack"
  ports {
    internal = 4567
    external = 4567
  }
}