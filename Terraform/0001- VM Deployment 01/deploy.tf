terraform {
  backend "azurerm" {
    source  = "hashicorp/azurerm"
    version = "=2.46.0"
    resource_group_name  = #{resource_group_name}#
    storage_account_name = #{storage_account_name}#
    container_name       = #{container_name}#
    key                  = #{TerraformStorageKey}#
  }
}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


module "VNet"{
source = "../../Modules/Virtual Network/"
}
        
        
        
        
