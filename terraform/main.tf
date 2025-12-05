terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# -----------------------------
# Resource Group
# -----------------------------
resource "azurerm_resource_group" "devops_rg" {
  name     = "devops-rg"
  location = "westeurope"
}

# -----------------------------
# Container Instance
# -----------------------------
resource "azurerm_container_group" "devops_container" {
  name                = "hellodevops-container"
  location            = azurerm_resource_group.devops_rg.location
  resource_group_name = azurerm_resource_group.devops_rg.name
  os_type             = "Linux"

  container {
    name   = "hellodevops"
    image  = "hellodevops:latest"  # később cserélheted Docker Hub image-re
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8080
      protocol = "TCP"
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "hellodevops-${random_integer.suffix.result}"
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}