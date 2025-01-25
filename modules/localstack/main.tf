# File: localstack.tf

# Define the LocalStack image
resource "docker_image" "localstack" {
  name = "localstack/localstack"
}

# Define the main LocalStack container
resource "docker_container" "localstack" {
  name  = "localstack"
  image = docker_image.localstack.name
  ports {
    internal = 4566
    external = 4566
  }
  hostname = "localstack"
  networks_advanced {
    name = var.network_name  
  }
  env = {
    S3_ENDPOINT                = "http://s3:4566"
    DYNAMODB_ENDPOINT          = "http://dynamodb:4566"
    LAMBDA_ENDPOINT            = "http://lambda:4566"
    APIGATEWAY_ENDPOINT        = "http://apigateway:4566"
    CLOUDWATCH_ENDPOINT        = "http://cloudwatch:4566"
    EC2_ENDPOINT               = "http://ec2:4566"
    # Add other services as needed
  }
}

