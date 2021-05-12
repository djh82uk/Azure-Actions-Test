terraform {
  backend "azurerm" {
    source  = "hashicorp/azurerm"
    version = "=2.46.0"
    resource_group_name  = ${{ secrets.STORAGEACCOUNTRG }}
    storage_account_name = ${{ secrets.STORAGEACCOUNTNAME }}
    container_name       = ${{ secrets.STORAGECONTAINERNAME }}
    key                  = "prod.terraform.tfstate"
  }
}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
