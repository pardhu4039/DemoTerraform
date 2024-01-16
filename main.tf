provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

module "network" {
  source = "./modules/network"
}

module "ec2" {
  source            = "./modules/ec2"

}
