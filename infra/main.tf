

resource "azuredevops_project" "project" {
  name               = var.project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Managed by Terraform"
}

resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = azuredevops_project.project.id
  service_endpoint_name = "GitHub Service Connection"
  auth_personal {
    personal_access_token = var.github_pat
  }
}

resource "azuredevops_serviceendpoint_azurerm" "azurerm" {
  project_id                             = azuredevops_project.project.id
  service_endpoint_name                  = "Azure Service Connection"
  service_endpoint_authentication_scheme = "ServicePrincipal"
  description                            = "Managed by Terraform"
  credentials {
    serviceprincipalid  = var.client_id
    serviceprincipalkey = var.client_secret
  }

  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
}

resource "azuredevops_build_definition" "pipeline" {
  project_id = azuredevops_project.project.id
  name       = "WebGoat DevSecOps Pipeline"
  path       = "\\"
  repository {
    repo_type   = "GitHub"
    repo_id     = var.github_repository_name
    branch_name = "main"
    yml_path    = "azure-pipelines.yml"
  }
  ci_trigger {
    use_yaml = true
  }
  pull_request_trigger {
    use_yaml = true
    forks {
      enabled       = false
      share_secrets = false
    }
  }
}
