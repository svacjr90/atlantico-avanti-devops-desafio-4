terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  profile = "admin"
  region  = "us-east-1"

  default_tags {
    tags = {
      Name    = "bt-avanti"
      Desafio = "2"
    }
  }
}