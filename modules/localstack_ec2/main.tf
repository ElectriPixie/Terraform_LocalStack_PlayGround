# File: localstack_ec2.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint list
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints :
    key => value if !contains(var.skip_endpoint, key)
  })
}

# Define the EC2 container
resource "docker_container" "localstack_ec2" {
  name       = "localstack-ec2"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    #external = 4590
  }
  env = flatten([
    for key, value in merge(local.service_endpoints_without_skip, var.environment) : 
    "${key}=${value}"
  ]) 
  hostname="ec2"
  networks_advanced {
    name = var.network_name  
  }
}