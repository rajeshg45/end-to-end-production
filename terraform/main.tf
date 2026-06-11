# =====================================================================
# PRIMARY REGION (us-east-1)
# =====================================================================

module "vpc_primary" {
  source                = "./modules/vpc"
  aws_region            = var.primary_region
  environment           = "${var.environment}-primary"
  vpc_cidr              = var.primary_vpc_cidr
  public_subnet_1_cidr  = var.primary_public_1_cidr
  public_subnet_2_cidr  = var.primary_public_2_cidr
  private_subnet_1_cidr = var.primary_private_1_cidr
  private_subnet_2_cidr = var.primary_private_2_cidr
  single_nat_gateway    = var.single_nat_gateway
}

module "sg_primary" {
  source      = "./modules/sg"
  environment = "${var.environment}-primary"
  vpc_id      = module.vpc_primary.vpc_id
  server_port = var.server_port
}

module "ec2_primary" {
  source                 = "./modules/ec2"
  environment            = "${var.environment}-primary"
  vpc_id                 = module.vpc_primary.vpc_id
  public_subnet_ids      = module.vpc_primary.public_subnet_ids
  private_subnet_ids     = module.vpc_primary.private_subnet_ids
  instance_type          = var.primary_instance_type
  ami_id                 = var.primary_ami_id
  server_port            = var.server_port
  alb_security_group_id = module.sg_primary.alb_sg_id
  ec2_security_group_id = module.sg_primary.ec2_sg_id
}

# =====================================================================
# SECONDARY REGION (us-west-2)
# =====================================================================

module "vpc_secondary" {
  source    = "./modules/vpc"
  providers = { aws = aws.secondary }

  aws_region            = var.secondary_region
  environment           = "${var.environment}-secondary"
  vpc_cidr              = var.secondary_vpc_cidr
  public_subnet_1_cidr  = var.secondary_public_1_cidr
  public_subnet_2_cidr  = var.secondary_public_2_cidr
  private_subnet_1_cidr = var.secondary_private_1_cidr
  private_subnet_2_cidr = var.secondary_private_2_cidr
  single_nat_gateway    = var.single_nat_gateway
}

module "sg_secondary" {
  source    = "./modules/sg"
  providers = { aws = aws.secondary }

  environment = "${var.environment}-secondary"
  vpc_id      = module.vpc_secondary.vpc_id
  server_port = var.server_port
}

module "ec2_secondary" {
  source    = "./modules/ec2"
  providers = { aws = aws.secondary }

  environment            = "${var.environment}-secondary"
  vpc_id                 = module.vpc_secondary.vpc_id
  public_subnet_ids      = module.vpc_secondary.public_subnet_ids
  private_subnet_ids     = module.vpc_secondary.private_subnet_ids
  instance_type          = var.secondary_instance_type
  ami_id                 = var.secondary_ami_id
  server_port            = var.server_port
  alb_security_group_id = module.sg_secondary.alb_sg_id
  ec2_security_group_id = module.sg_secondary.ec2_sg_id
}
