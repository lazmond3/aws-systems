terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "tfstate-bucket-mysql"
    key    = "tfstate-bucket-mysql/tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

module rds {
    source = "../module/rds"
    vpc_id = var.vpc_id
    password = var.mysql_password
}
