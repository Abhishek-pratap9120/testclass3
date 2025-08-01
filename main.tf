terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "25a58ceb-2570-42e2-9d35-00b46979c51a"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_resource_group" "vnetblock" {
  name     = "sadhanavnet"
  location = "West Europe"
}