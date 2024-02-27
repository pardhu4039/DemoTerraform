
data "aws_vpc" "vpc" {
    id = module.networking.vpc
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = ["${var.namespace}-vpc-private-${var.region}a"]
    
  }
}

data "aws_subnets" "public" {
  filter {
    name = "tag:Name"
    values = ["${var.namespace}-vpc-public-${var.region}a"]
    
  }
}

data "aws_security_groups" "public_sg" {
  filter {
    name   = "group-name"
    values = ["${var.namespace}-allow_ssh_pub"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  }

data "aws_security_groups" "private_sg" {
  filter {
    name   = "group-name"
    values = ["${var.namespace}-allow_ssh_priv"]
  }
filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  
}
