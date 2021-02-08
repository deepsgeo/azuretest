variable "resource_gp" {
    type = string
    default = "testrg"
    description = "Resource group name"
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