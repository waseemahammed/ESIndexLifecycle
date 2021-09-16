
terraform{
  backend "s3" {
    bucket = "terraformbaket"
    key="rohit.tfstate"
    
    access_key = "AKIAZFTVRWEBVT4RUB4S"
    secret_key = "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"
  }
}

provider "aws" {
 region = var.region
}

variable "region" {
  type = string
  description = "AWS region where you want to deploy the infrastructure"
}


