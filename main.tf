provider "aws" {
  region = "eu-west-1"
}

module "network" {
  source = "./modules/network"
}

module "proxy" {
  source        = "./modules/ec2-proxy"
  vpc_id        = module.network.vpc.id
  subnet_id     = module.network.public_subnets.0.id
  proxy_to_ip   = "<REDACTED>"
  proxy_to_port = "80"
}
