variable "service_endpoints" { 
  description = "Map of environment variables for configuring LocalStack services."
  type = map(string)
  default = {
    S3_ENDPOINT          = "http://s3:4566"
    DYNAMODB_ENDPOINT    = "http://dynamodb:4566"
    LAMBDA_ENDPOINT      = "http://lambda:4566"
    APIGATEWAY_ENDPOINT  = "http://apigateway:4566"
    CLOUDWATCH_ENDPOINT  = "http://cloudwatch:4566"
    EC2_ENDPOINT         = "http://ec2:4566"
    # Add other services as needed
  }
}
variable "environment_root" {
  description = "A map of environment variables for LocalStack services from the root variables.tf"
  type = map(string)
  default = {
    DEFAULT_REGION          = "us-east-1"
    AWS_ACCESS_KEY_ID       = "test"     # Set your mock access key (LocalStack default)
    AWS_SECRET_ACCESS_KEY   = "test"     # Set your mock secret key (LocalStack default)
    AWS_DEFAULT_REGION      = "us-east-1"
  }
}