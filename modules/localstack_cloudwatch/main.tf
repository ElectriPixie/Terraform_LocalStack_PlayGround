# File: localstack_cloudwatch.tf

# Define the CloudWatch container
resource "docker_container" "localstack_cloudwatch" {
  name       = "localstack-cloudwatch"
  image      = "localstack/localstack"
  provider = docker
  ports {
    internal = 4571
    external = 4571
  }
  env = ["SERVICES=cloudwatch"]
  hostname = "cloudwatch"
  networks_advanced {
    name = var.network_name  
  }
}