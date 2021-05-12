resource "azurerm_virtual_network" "VNET1" {
  name                = "GitHub-Test-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = "west europe"
  resource_group_name = "GitHub-Test-RG"
}

resource "azurerm_subnet" "VNET1" {
  name                 = "VMs"
  resource_group_name  = "GitHub-Test-RG"
  virtual_network_name = "GitHub-Test-VNet"
  address_prefixes     = ["10.0.2.0/24"]
}
