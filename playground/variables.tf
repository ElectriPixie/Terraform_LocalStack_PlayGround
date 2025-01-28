variable "environment_root" {
  description = "A map of environment variables for LocalStack services from the root variables.tf"
  type = map(string)
  default = {
    DEFAULT_REGION          = "us-east-1"
    AWS_ACCESS_KEY_ID       = "my_secret_key"     # Set your mock access key (LocalStack default)
    AWS_SECRET_ACCESS_KEY   = "my_secret_key"     # Set your mock secret key (LocalStack default)
    AWS_DEFAULT_REGION      = "us-east-1"
  }
}