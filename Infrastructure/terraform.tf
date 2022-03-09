terraform {
  required_version = "<1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }

  backend "s3" {
    bucket         = "bd-tfstate"
    region         = "us-east-1"
    key            = "bd-project.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}