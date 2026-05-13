terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"
  
  project_name = var.project
  environment = var.environment
  vpc_cidr  = "10.0.0.0/17"  
}

module "ec2" {
  source = "../../modules/ec2/"
  
  subnet_id = module.vpc.public_subnet_1_id
  project_name = var.project
  environment = var.environment
}

module "bucket" {
  source = "../../modules/s3/"

  bucket_name = "aws-terraform-dev-adrian"
  project_name = var.project
  environment = var.environment
}
