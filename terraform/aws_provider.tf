
terraform{
  backend "s3" {
    bucket = "terraformbaket"
    key="mukul.tfstate"
    
  }
}

provider "aws" {
 region = var.region
}

variable "region" {
  type = string
  description = "AWS region where you want to deploy the infrastructure"
}


