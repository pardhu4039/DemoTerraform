provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

module "network" {
  source             = "./modules/network"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.101.0/24"
}

module "ec2_instance" {
  source              = "./modules/ec2"
  ami                 = "ami-0123456789abcdef0"
  instance_type       = "t2.micro"
  subnet_id           = "subnet-0123456789abcdef1"
  security_group_ids  = ["sg-0123456789abcdef2"]
  key_name            = "your-key-pair-name"
}
