terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.45"
    }
  }
}
  # Provider Block
provider "aws" {
    region  = "us-east-2"
  }

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "bootcamp30-state-files"
    key    = "modules/terraform.tfstate"
    region = "us-east-2"
  }
}

/*data "terraform_remote_state" "network" {
  backend = "local"
  config = {
      path    = "../remote-data-source/terraform.tfstate"
  }
}*/