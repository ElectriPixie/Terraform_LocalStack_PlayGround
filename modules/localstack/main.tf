# File: localstack.tf

# Define the LocalStack image
resource "docker_image" "localstack" {
  name = "localstack/localstack"
}

# Define the main LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = docker_image.localstack.name
  ports {
    internal = 4566
    external = 4566
  }
  hostname = "localstack"
  networks_advanced {
    name = var.network_name  
  }
  env = merge(var.service_endpoints, var.environment)
}
