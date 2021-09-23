
terraform {
  backend "s3" {
    bucket = "gokloud-platform-infrastructure"
    key    = "gokloud-website.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
 region = var.region
}

variable "region" {
  type = string
  description = "AWS region where you want to deploy the infrastructure"
}


