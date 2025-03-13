provider "aws" {
    region = "us-east-2"
}

terraform {
  required_providers {
    aws = {  # ✅ The provider name must be explicitly declared
      source  = "hashicorp/aws"
      version = "~> 4.6"
    }
  }
}


terraform {
  backend "s3" {
    bucket       = "movie-app-backend"
    key          = "backend/terraform.tfstate"
    region       = "us-east-2"
  }
}