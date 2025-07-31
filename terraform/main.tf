provider "aws" {
  region = "eu-central-1"
  profile = "ReadOnlyAccess-382650357241"
}

module "networking" {
  source              = "./modules/networking"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  project_name        = "logstash-project"
}
module "bastion" {
  source        = "./modules/compute"
  name          = "bastion"
  ami_id        = "ami-02003f9f0fde924ea"
  instance_type = "t2.micro"
  subnet_id     = module.networking.public_subnet_id
  vpc_id        = module.networking.vpc_id
  ingress_rules = [
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      source    = "0.0.0.0/0"
    }
  ]
  egress_rules = [
    {
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
module "logstash" {
  source        = "./modules/compute"
  name          = "logstash"
  ami_id        = "ami-02003f9f0fde924ea"
  instance_type = "t2.micro"
  subnet_id     = module.networking.private_subnet_id
  vpc_id        = module.networking.vpc_id
  ingress_rules = [
    {
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      source_sg  = module.bastion.security_group_id
    }
  ]
  egress_rules = [
    {
      from_port  = 9200
      to_port    = 9200
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
output "vpc_id" {
  value = module.networking.vpc_id
}
output "public_subnet_id" {
  value = module.networking.public_subnet_id
}
output "private_subnet_id" {
  value = module.networking.private_subnet_id
}
output "bastion_instance_id" {
  value = module.bastion.instance_id
}
output "logstash_instance_id" {
  value = module.logstash.instance_id
}
output "bastion_security_group" {
  value = module.bastion.security_group_id
}