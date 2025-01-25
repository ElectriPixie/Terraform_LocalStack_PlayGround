# File: localstack_cloudwatch.tf

# Define the CloudWatch container
resource "docker_container" "localstack_cloudwatch" {
  name       = "localstack-cloudwatch"
  image      = "localstack/localstack"
  provider = docker
  ports {
    internal = 4566
    #external = 4580
  }
  env = toset(merge(var.service_endpoints, var.environment))
  hostname = "cloudwatch"
  networks_advanced {
    name = var.network_name  
  }
}