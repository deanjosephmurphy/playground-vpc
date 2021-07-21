terraform {
  /* backend "remote" {
      organization = "Dean-Murphy-Messe-Frankfurt"
      workspaces {
          name = "vpc-dev"
      }
  }   */
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_eip" "nat" {
  count = 3

  vpc = true
}