# File: localstack_ec2.tf

# Define the EC2 container
resource "docker_container" "localstack_ec2" {
  name       = "localstack-ec2"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    #external = 4590
  }
  env = toset(merge(var.service_endpoints, var.environment))
  hostname="ec2"
  networks_advanced {
    name = var.network_name  
  }
}