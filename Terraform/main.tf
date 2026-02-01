# VPC Module
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
  region = var.region
}

# Security Groups Module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  vpc_cidr_block = var.vpc_cidr_block
}

# VPC Endpoints Module
module "endpoints" {
  source = "./modules/endpoints"
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_id
  private_route_table_ids = module.vpc.private_route_table_ids
  vpc_cidr_block          = var.vpc_cidr_block
  vpc_endpoint_sg_id      = module.security_groups.vpc_endpoint_sg_id
}

# ACM Module
module "acm" {
  source = "./modules/acm"
  domain_name = var.domain_name
}

# ALB Module
module "alb" {
  source = "./modules/alb"
  
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_id
  alb_sg_id          = module.security_groups.alb_sg_id
  certificate_arn    = module.acm.certificate_arn 
}

# IAM Module
module "iam" {
  source = "./modules/iam"
}

# Route 53 Module
module "route53" {
  source = "./modules/route53"
  domain_name   = var.domain_name
  alb_dns_name  = module.alb.alb_dns_name
  alb_zone_id   = module.alb.alb_zone_id
}