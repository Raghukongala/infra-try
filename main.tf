terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"

  environment      = var.environment
  instance_name    = var.instance_name
  instance_type    = var.instance_type
  instance_count   = var.instance_count
  root_volume_size = var.root_volume_size
  key_name         = var.key_name
  tags             = var.tags
}
