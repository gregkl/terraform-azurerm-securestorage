terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
}
locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name      = var.resource_group_name
  location                 = var.location
  name                     = var.storage_account_name
  account_tier             = "Standard"
  Account_replication_type = var.environment == "Production" ? "GRS" : "LRS"
  public_network_acces     = false

  tags = local.tags

}
