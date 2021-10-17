provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vault" {
  name     = "vault-rg"
  location = "West US 2"

  tags = {
    environment = "DEV"
  }
}

resource "azurerm_kubernetes_cluster" "vault-cluster" {
  name                = "vault-cluster-aks"
  location            = azurerm_resource_group.vault.location
  resource_group_name = azurerm_resource_group.vault.name
  dns_prefix          = "vault-cluster-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 3
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "DEV"
  }
}
