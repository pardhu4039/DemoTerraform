data "aws_vpc" "vpc" {
    id = module.networking.vpc
}

data "aws_security_group" "public_sg" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-allow_ssh_pub"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  }

data "aws_security_group" "private_sg" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-allow_ssh_priv"]
  }
filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  
}

data "aws_subnet" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name = "tag:Name"
    values = [
      "*-private-*a"
    ]
  }
}

data "aws_subnet" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name = "tag:Name"
    values = [
      "*-public-*a"
    ]
  }
}
