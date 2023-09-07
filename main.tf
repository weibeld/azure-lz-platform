terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  skip_provider_registration = true
}

module "caf-enterprise-scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "4.2.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = "cloud-foundation"
  default_location = "switzerlandnorth"
  # Prevents usage data collection by Microsoft. This prevents the creation of
  # the following resources:
  # - azurerm_subscription_template_deployment
  # - random_id
  disable_telemetry = true
  root_name = "Dev"
  root_id = "dev"
}
