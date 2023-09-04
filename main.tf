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

  root_parent_id = "72a44a42-bb1a-4e84-ac1e-4654b21555f4"
  default_location = "switzerlandnorth"
}
