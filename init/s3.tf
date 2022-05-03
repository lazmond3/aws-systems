terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "tfstate-bucket-mysql" {
  bucket = "tfstate-bucket-mysql"

  tags = {
    Name = "tfstate-bucket-mysql/tfstate"
  }
}

# --- option ----
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.tfstate-bucket-mysql.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tfstate-bucket-mysql.id

  versioning_configuration {
    status = "Enabled"
  }
}
