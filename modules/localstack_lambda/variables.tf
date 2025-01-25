variable "network_name" {}
variable "service_endpoints" {
  description = "Map of environment variables for configuring LocalStack service endpoints."
  type = list(string)
  default = {}
}
variable "environment" {
  description = "A map of environment variables for LocalStack services."
  type = list(string)
  default = {
    SERVICES = "lambda"
  }
}