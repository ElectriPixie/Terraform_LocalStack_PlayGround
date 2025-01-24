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

module localstack {
  source = "./localstack"
  providers = { docker=docker }
}

module "localstack_s3" {
  source = "./localstack/localstack_s3"
  providers = { docker=docker }
}

module "localstack_dynamodb" {
  source = "./localstack/localstack_dynamodb"
  providers = { docker=docker }
}

module "localstack_lambda" {
  source = "./localstack/localstack_lambda"
  providers = { docker=docker }
}

module "localstack_api_gateway" {
  source = "./localstack/localstack_api_gateway"
  providers = { docker=docker }
}

module "localstack_cloudwatch" {
  source = "./localstack/localstack_cloudwatch"
  providers = { docker=docker }
}

module "localstack_ec2" {
  source = "./localstack/localstack_ec2"
   providers = { docker=docker }
}