# File: localstack_cloudwatch.tf

module "localstack" {
  source = "../../localstack"
}

# Define the CloudWatch container
resource "docker_container" "localstack_cloudwatch" {
  name       = "localstack-cloudwatch"
  image      = "localstack/localstack"
  provider = docker
  ports {
    internal = 4571
    external = 4571
  }
  depends_on = [module.localstack] # Start after the main container
}