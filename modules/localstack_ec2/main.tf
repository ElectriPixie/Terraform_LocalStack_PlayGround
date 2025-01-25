# File: localstack_ec2.tf

# Define the EC2 container
resource "docker_container" "localstack_ec2" {
  name       = "localstack-ec2"
  image      = "localstack/localstack"
  ports {
    internal = 4570
    external = 4570
  }
  hostname="ec2"
  networks_advanced {
    name = var.network_name  
  }
  command = [
    "localstack",
    "start",
    "--services",
    "aws_ec2",
  ]
}