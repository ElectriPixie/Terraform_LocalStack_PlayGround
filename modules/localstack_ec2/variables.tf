variable "network_name" {}
variable "services"{
  description = "LocalStack service name"
  type = list(string)
  default=["ec2"]
}
variable "service_endpoints" {
  description = "Map of environment variables for configuring LocalStack service endpoints."
  type = map(string)
  default = {}
}
variable "environment_root" {
  description = "A map of environment variables for LocalStack services from the root variables.tf"
  type = map(string)
  default = {
  }
}
variable "environment" {
  description = "A map of environment variables for LocalStack services."
  type = map(string)
  default = {
  }
}
variable "skip_endpoint" {
  description = "The key for the endpoint to remove"
  type        = list(string)
  default     = ["EC2_ENDPOINT"]  # You can set a default or pass it as an input
}