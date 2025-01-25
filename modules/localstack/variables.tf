variable "network_name" {}

variable "ports" {
  description = "Ports to use"
  type = map(string)
  default = {
  }
}

variable "host_name" {
  description = "Container Hostname"
  type = string
  default=""
}

variable "container_name" {
  description = "Container Name"
  type = string
  default=""    
}

variable "image_name" {
  description = "Image Name"
  type = string
  default=""    
}

variable "services"{
  description = "LocalStack service name"
  type = list(string)
  default=[]
}

variable "environment_root" {
  description = "A map of environment variables for LocalStack services from the root variables.tf"
  type = map(string)
  default = {}
}

variable "environment" {
  description = "A map of environment variables for LocalStack services."
  type = map(string)
  default = {}
}