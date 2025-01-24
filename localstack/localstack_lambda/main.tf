# File: localstack_lambda.tf

module "localstack" {
  source = "../../localstack"
}

# Define the Lambda container
resource "docker_container" "localstack_lambda" {
  name       = "localstack-lambda"
  image      = "localstack/localstack"
  ports  {
    internal = 4568
    external = 4568
  }
  depends_on = [module.localstack] # Start after the main container
}