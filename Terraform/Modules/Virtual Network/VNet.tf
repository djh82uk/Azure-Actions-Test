resource "azurerm_virtual_network" "VNET1" {
  name                = "${var.vnet_name}"
  address_space       = "${var.addrspace}"
  location            = "${var.location}"
  resource_group_name = "${var.resourcegroup}"
}

output "vnetname" {
  value = "${azurerm_virtual_network.VNET1.name}"
  }
