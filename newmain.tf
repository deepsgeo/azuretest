terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
 
}
variable "location" {
    type = string
    description = "Location of the resource group"
    default = "eastus"
}    
variable "vnet_address_space" { 
    type = list
    description = "Address space for Virtual Network"
    default = ["172.16.0.0/16"]
}    

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "testrg"
    location = var.location
}

#Create virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "testvnet"
    address_space       = var.vnet_address_space
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "public"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "172.16.1.0/24"
}
