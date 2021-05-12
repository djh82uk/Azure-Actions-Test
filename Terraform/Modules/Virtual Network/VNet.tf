resource "azurerm_virtual_network" "VNET1" {
  name                = "${var.vnet_name}"
  address_space       = "${var.addrspace}"
  location            = "${var.location}"
  resource_group_name = "${var.resourcegroup}"
}

resource "azurerm_subnet" "VNET1" {
  name                 = "${var.subnet_name}"
  resource_group_name  = "${var.resourcegroup}"
  virtual_network_name = "${var.vnet_name}"
  address_prefixes     = "${var.addrprefixes}"
}
