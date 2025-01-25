# Define outputs for each resource
output "image" {
  value = docker_image.localstack.name
}

output "container" {
  value = docker_container.localstack.name
}