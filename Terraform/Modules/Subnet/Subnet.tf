resource "azurerm_subnet" "SUBNET1" {
  name                 = "${var.subnet_name}"
  resource_group_name  = "${var.resourcegroup}"
  virtual_network_name = "${var.vnet_name}"
  address_prefixes     = "${var.addrprefixes}"
}


output "subnetid" {
  value = "${azurerm_subnet.SUBNET1.id}"
  }
