terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "1.1.1"
    }
  }
  cloud {
    organization = "nklkarthi"
    workspaces {
      name = "webgoat-azure-devsecops"
    }
  }
}