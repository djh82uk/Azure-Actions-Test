resource "azurerm_network_interface" "VM1" {
  name                = "${var.vm_nic_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resourcegroup}"

  ip_configuration {
    name                          = "${var.ip_name}"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "${var.addr_allocation}"
  }
}

resource "azurerm_linux_virtual_machine" "VM1" {
  name                = "${var.vm_name}"
  resource_group_name = "${var.resourcegroup}"
  location            = "${var.location}"
  size                = "${var.vm_size}"
  admin_username      = "${var.vm_admin_user}"
  admin_password      = "${var.vm_admin_pass}"    
  network_interface_ids = [
    azurerm_network_interface.VM1.id,
  ]


  os_disk {
    caching              = "${var.osdisk_caching}"
    storage_account_type = "${var.storage_account_type}"
  }

  source_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }
}
