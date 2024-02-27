module "networking" {
  source          = "./modules/networking"
  namespace       = var.namespace
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  allow_all       = var.allow_all
  all_port        = var.all_port
  ssh_portnumber  = var.ssh_portnumber
  environment     = var.environment
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source            = "./modules/ec2"
  namespace         = var.namespace
  instance_type     = var.instance_type
  vpc               = data.aws_vpc.vpc.id
  sg_pub_id         = data.aws_security_groups.public_sg.id
  sg_priv_id        = data.aws_security_groups.private_sg.id
  key_name          = module.ssh-key.key_name
  private_subnet_id = data.aws_subnets.private.ids
  public_subnet_id  = data.aws_subnets.public.ids
}
