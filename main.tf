# --------------------------
# VPC Module
# --------------------------
module "vpc" {
  source                    = "./modules/vpc"
  project_name              = var.project_name
  aws_region                = var.aws_region
  vpc_cidr                  = var.vpc_cidr
  public_subnet_cidr        = var.public_subnet_cidr
  private_subnet_cidr       = var.private_subnet_cidr
  availability_zone_public  = var.availability_zone_public
  availability_zone_private = var.availability_zone_private
}

# --------------------------
# S3 Module
# --------------------------
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  aws_region  = var.aws_region
}

# --------------------------
# EC2 Module
# --------------------------
module "ec2" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  subnet_id     = module.vpc.public_subnet_id   # keep this
  vpc_id        = module.vpc.vpc_id             # add this line ✅
  aws_region    = var.aws_region
  key_name      = var.key_name
}

# --------------------------
# DynamoDB Module
# --------------------------
module "dynamodb" {
  source     = "./modules/dynamodb"
  aws_region = var.aws_region
  table_name = var.dynamodb_table_name
}
