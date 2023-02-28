provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 2.0.14" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "dees3devops"
    key    = "terraformecs.tfstate"
    region = "us-east-1"
  }
}

