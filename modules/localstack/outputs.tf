# Define outputs for each resource
output "image" {
  value = docker_image.localstack.name
}

output "container" {
  value = docker_container.localstack.name
}

#output "network" {
#  value = docker_network.localstack.name
#}