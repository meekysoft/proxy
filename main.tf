data "local_file" "creds" {
  # This must be the full path to your downloaded AWS credentials file
  filename = "/Users/pete/Downloads/terraform_accessKeys.csv" # <- CHANGE THIS
}

provider "aws" {
  region     = "eu-west-1"
  secret_key = csvdecode(data.local_file.creds.content).0["Secret access key"]
  access_key = csvdecode(data.local_file.creds.content).0["\ufeffAccess key ID"]
}

module "network" {
  source = "github.com/meekysoft/proxy/modules/network"
}

module "proxy" {
  source    = "github.com/meekysoft/proxy/modules/ec2-proxy"
  vpc_id    = module.network.vpc.id
  subnet_id = module.network.public_subnets.0.id

  # This example IP address goes to news.bbc.co.uk - replace it with your own IP
  proxy_to_ip = "212.58.244.57" # <- CHANGE THIS

  # Whatever port your service runs on - make sure your router port-forwards to this
  proxy_to_port = "80" # <- CHANGE THIS
}

module "route53" {
  source              = "github.com/meekysoft/proxy/modules/route53"
  a_record_ip_address = module.proxy.ec2_public_ip_address

  # This must be your top-level Route53 domain name (the trailing dot matters)
  hosted_zone_name = "beta.simquik.com." # <- CHANGE THIS

  # This is a subdomain for your proxy, which is pre-pended to the above `hosted_zone_name`
  # so the resulting url for the proxy in this example would be http://stats.beta.simquik.com
  a_record_name = "stats" # <- CHANGE THIS
}
