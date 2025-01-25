# File: localstack_cloudwatch.tf

locals {
  # Remove the service endpoints specified by the skip_endpoint list
  service_endpoints_without_skip = tomap({
    for key, value in var.service_endpoints :
    key => value if !contains(var.skip_endpoint, key)
  })
  services_map = length(var.services) > 0 ? {
    "SERVICES" = join(",", var.services)
  } : {}
}

# Define the CloudWatch container
resource "docker_container" "localstack_cloudwatch" {
  name       = "localstack-cloudwatch"
  image      = "localstack/localstack"
  provider = docker
  ports {
    internal = 4566
    #external = 4580
  }
  env = flatten([
  for key, value in merge(local.service_endpoints_without_skip, var.environment, var.environment_root,local.services_map) : 
    "${key}=${value}"
  ]) 
  hostname = "cloudwatch"
  networks_advanced {
    name = var.network_name  
  }
}