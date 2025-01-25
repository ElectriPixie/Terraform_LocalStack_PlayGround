# File: main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///home/pixie/.docker/desktop/docker.sock"
}

module localstack_network {
  source = "./modules/localstack_network"
  providers = { docker=docker }
}

module "localstack" {
  source = "./modules/localstack"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  #service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}