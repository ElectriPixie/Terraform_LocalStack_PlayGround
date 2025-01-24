# File: localstack_s3.tf

# Define the S3 container
resource "docker_container" "localstack_s3" {
  name       = "localstack-s3"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    external = 4566
  }
}