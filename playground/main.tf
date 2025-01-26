# File: main.tf

module localstack_network {
  source = "https://github.com/ElectriPixie/Terraform_LocalStack_Network_Module.git"
  providers = { docker=docker }
}

module "localstack" {
  source = ""
  providers = { docker=docker }
  network_name = module.localstack_network.network_name
  environment_root = var.environment_root
  host_name = "localstack"
  container_name = "localstack"
  image_name = "localstack/localstack"
  ports = [{internal=4566, external=4566, protocol=""}]
}