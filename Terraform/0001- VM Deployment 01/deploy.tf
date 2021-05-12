terraform {
  backend "azurerm" {
    resource_group_name  = "#{resource_group_name}#"
    storage_account_name = "#{storage_account_name}#"
    container_name       = "#{container_name}#"
    key                  = "#{blob_name}#"
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG1" {
  name     = "GitHub-Test-RG"
  location = "West Europe"
}

module "VNet"{
source = "../Modules/Virtual Network/"
vnet_name       = "GitHub-Test-VNet"
resourcegroup   = "${azurerm_resource_group.RG1.name}"
addrspace       = ["10.0.0.0/16"]
location        = "${azurerm_resource_group.RG1.location}"
subnet_name     = "vmsubnet"
addrprefixes    = ["10.0.2.0/24"]
}
  
  
module "VM"{
source = "../Modules/Linux Virtual Machine/"
resourcegroup         = "${azurerm_resource_group.RG1.name}"
location              = "${azurerm_resource_group.RG1.location}"
vm_nic_name           = "GitHub-Test-NIC"  
ip_name               = "GitHub-Test-IP" 
vm_name               = "GitHub-Test-VM"  
vm_size               = "B1s" 
vm_admin_user         = "#{admin_user}#" 
vm_admin_pass         = "#{admin_pass}#" 
osdisk_caching        = "ReadWrite"
storage_account_type  = "Standard_LRS"
image_publisher       = "Canonical"
image_offer           = "UbuntuServer"
image_sku             = "18.04-LTS"
image_version         = "latest"
subnet_id             = "${azurerm_subnet.VNET1.id}"
}

  
  

  

