variable "service_endpoints" { 
  description = "Map of environment variables for configuring LocalStack services."
  type = list(string)
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