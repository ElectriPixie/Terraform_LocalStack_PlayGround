# File: localstack.tf

# Define the LocalStack image
resource "docker_image" "localstack" {
  name = "localstack/localstack"
}

# Define the main LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = docker_image.localstack.name
}

# Define the LocalStack network
#resource "docker_network" "localstack" {
#  name = "localstack"
#}