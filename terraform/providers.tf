terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "ultimate-devops-project-826852689517"
    key     = "ecr/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }

}

provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Project   = "ultimate-devops-project"
    }
  }
}


