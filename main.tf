provider "aws" {
  region = "us-west-2"
}

# VPC Module
module "vpc" {
  source = "./vpc"
}

# Subnets Module
module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
}

# Security Group Module
module "sg" {
  source       = "./sg"
  vpc_id       = module.vpc.vpc_id
  allowed_ip   = "192.112.66.25/32"
}

# EC2 Module
module "ec2" {
  source           = "./ec2"
  subnet_id        = module.subnets.subnet_ids[1]
  security_group_id = module.sg.security_group_id
}
