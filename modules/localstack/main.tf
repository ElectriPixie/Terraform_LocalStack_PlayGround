# File: localstack.tf

# Define the LocalStack image
resource "docker_image" "localstack" {
  name = "localstack/localstack"
}

# Define the main LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = docker_image.localstack.name
  hostname = "localstack"
  networks_advanced {
    name = var.network_name  
  }
}

