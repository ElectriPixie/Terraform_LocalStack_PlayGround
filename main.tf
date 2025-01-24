# File: localstack.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# Define the Docker provider
provider "docker" {
  #host = "unix:///var/run/docker.sock"
  host = "unix:///home/pixie/.docker/desktop/docker.sock"
}

# Define the LocalStack image
resource "docker_image" "localstack" {
  name = "localstack/localstack"
}

# Define the main LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = docker_image.localstack.name
}

# Define the LocalStack network
resource "docker_network" "localstack" {
  name = "localstack"
}

# Define the S3 container
resource "docker_container" "localstack_s3" {
  name       = "localstack-s3"
  image      = "localstack/localstack"
  ports {
    internal = 4566
    external = 4566
  }
  depends_on = [docker_container.localstack]  # Start after the main container
}

# Define the DynamoDB container
resource "docker_container" "localstack_dynamodb" {
  name       = "localstack-dynamodb"
  image      = "localstack/localstack"
  ports {
    internal = 4567
    external = 4567
  }
  depends_on = [docker_container.localstack]  # Start after the main container
}

# Define the Lambda container
resource "docker_container" "localstack_lambda" {
  name       = "localstack-lambda"
  image      = "localstack/localstack"
  ports  {
    internal = 4568
    external = 4568
  }
  depends_on = [docker_container.localstack]  # Start after the main container
}

# Define the API Gateway container
resource "docker_container" "localstack_api_gateway" {
  name       = "localstack-api-gateway"
  image      = "localstack/localstack"
  ports {
    internal = 4569
    external = 4569
  }
  depends_on = [docker_container.localstack]  # Start after the main container
}

# Define the EC2 container
resource "docker_container" "localstack_ec2" {
  name       = "localstack-ec2"
  image      = "localstack/localstack"
  ports {
    internal = 4570
    external = 4570
  }
  depends_on = [docker_container.localstack]  # Start after the main container
}

# Define the CloudWatch container
resource "docker_container" "localstack_cloudwatch" {
  name       = "localstack-cloudwatch"
  image      = "localstack/localstack"
  ports {
    internal = 4571
    external = 4571
  }
  depends_on = [docker_container.localstack]  # Start after the main container
}
