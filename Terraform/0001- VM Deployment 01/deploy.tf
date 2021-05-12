terraform {
  backend "azurerm" {
    source  = "hashicorp/azurerm"
    version = "=2.46.0"
    resource_group_name  = #{resource_group_name}#
    storage_account_name = #{storage_account_name}#
    container_name       = #{container_name}#
    key                  = "#{blob_name}#"
  }
}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "VM1" {
  name     = "GitHub-Test-RG"
  location = "West Europe"
}

module "VNet"{
source = "../../Modules/Virtual Network/"
}
        
        
        
        
