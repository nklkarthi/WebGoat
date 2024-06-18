provider "azurerm" {
  # Configuration options
  features {

  }
  client_id                  = var.client_id
  client_secret              = var.client_secret
  tenant_id                  = var.tenant_id
  subscription_id            = var.subscription_id
  skip_provider_registration = true
}

provider "azuredevops" {
  org_service_url       = var.azure_devops_org_service_url
  personal_access_token = var.azure_devops_pat
}
