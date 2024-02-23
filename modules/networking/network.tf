// TODO break public and private into separate AZs
data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name                             = "${var.namespace}-vpc"
  cidr                             = var.cidr
  azs                              = data.aws_availability_zones.available.names
  private_subnets                  = var.private_subnets
  public_subnets                   = var.public_subnets
  #assign_generated_ipv6_cidr_block = true
  create_database_subnet_group     = true
  enable_nat_gateway               = true
  single_nat_gateway               = true
}

// SG to allow SSH connections from anywhere
resource "aws_security_group" "allow_ssh_pub" {
  name        = "${var.namespace}-allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from the internet"
    from_port   = var.ssh_portnumber
    to_port     = var.ssh_portnumber
    protocol    = "tcp"
    cidr_blocks = [var.allow_all]
  }

  egress {
    from_port   = var.all_port
    to_port     = var.all_port
    protocol    = "-1"
    cidr_blocks = [var.allow_all]
  }

  tags = {
    Name = "${var.namespace}-allow_ssh_pub"
  }
}

// SG to onlly allow SSH connections from VPC public subnets
resource "aws_security_group" "allow_ssh_priv" {
  name        = "${var.namespace}-allow_ssh_priv"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH only from internal VPC clients"
    from_port   = var.ssh_portnumber
    to_port     = var.ssh_portnumber
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = var.all_port
    to_port     = var.all_port
    protocol    = "-1"
    cidr_blocks = [var.allow_all]
  }

  tags = {
    Name = "${var.namespace}-allow_ssh_priv"
  }
}
