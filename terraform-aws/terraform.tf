terraform {
  required_version = "1.8.5"

  cloud {
    organization = "nklkarthi"

    workspaces {
      name = "webgoat-azure-devsecops"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
