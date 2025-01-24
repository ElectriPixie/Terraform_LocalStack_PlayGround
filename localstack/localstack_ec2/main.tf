# File: localstack_ec2.tf

module "localstack" {
  source = "../../localstack"
}

# Define the EC2 container
resource "docker_container" "localstack_ec2" {
  name       = "localstack-ec2"
  image      = "localstack/localstack"
  ports {
    internal = 4570
    external = 4570
  }
  depends_on = [module.localstack] # Start after the main container
}