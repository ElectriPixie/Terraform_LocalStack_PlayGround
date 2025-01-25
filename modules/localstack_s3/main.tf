# File: localstack_s3.tf

# Define the S3 container
resource "docker_container" "localstack_s3" {
  name       = "localstack-s3"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    external = 4566
  }
  hostname = "s3"
  networks_advanced {
    name = var.network_name  
  }
  command = [
    "localstack",
    "start",
    "--services",
    "aws_s3",
  ]
}