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
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}

module "localstack_s3" {
  source = "./modules/localstack_s3"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}

module "localstack_dynamodb" {
  source = "./modules/localstack_dynamodb"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}

module "localstack_lambda" {
  source = "./modules/localstack_lambda"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}

module "localstack_api_gateway" {
  source = "./modules/localstack_api_gateway"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}

module "localstack_cloudwatch" {
  source = "./modules/localstack_cloudwatch"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}

module "localstack_ec2" {
  source = "./modules/localstack_ec2"
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  service_endpoints = var.service_endpoints
  environment_root = var.environment_root
}