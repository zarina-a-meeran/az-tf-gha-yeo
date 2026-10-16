terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-tfstate-learning"
    storage_account_name = "sttfstatelearn12345"
    container_name       = "tfstate"
    key                  = "learning.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "learning" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "learning"
    managed_by  = "terraform"
  }
}

# resource "azurerm_service_plan" "learning" {
#   name                = var.app_service_plan
#   resource_group_name = azurerm_resource_group.learning.name
#   location            = azurerm_resource_group.learning.location
#   sku_name            = "F1"
#   os_type             = "Windows"
# }

# resource "azurerm_windows_web_app" "learning" {
#   name                = var.app_service
#   resource_group_name = azurerm_resource_group.learning.name
#   location            = azurerm_service_plan.learning.location
#   service_plan_id     = azurerm_service_plan.learning.id

#   site_config {}
# }


# resource "azurerm_storage_account" "learning" {
#   name                     = var.storage_account
#   resource_group_name      = azurerm_resource_group.learning.name
#   location                 = azurerm_resource_group.learning.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_mssql_server" "learning" {
#   name                         = var.sql_server
#   resource_group_name          = azurerm_resource_group.learning.name
#   location                     = azurerm_resource_group.learning.location
#   version                      = "12.0"
#   administrator_login          = "missadministrator"
#   administrator_login_password = "thisIsKat11"
#   minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "00000000-0000-0000-0000-000000000000"
#   }

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_mssql_database" "learning" {
#   name         = var.sql_database
#   server_id    = azurerm_mssql_server.learning.id
#   collation    = "SQL_Latin1_General_CP1_CI_AS"
#   license_type = "LicenseIncluded"
#   max_size_gb  = 2
#   sku_name     = "S0"
#   enclave_type = "VBS"

#   tags = {
#     foo = "bar"
#   }

#   # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# data "azurerm_client_config" "current" {}

# resource "azurerm_key_vault" "learning" {
#   name                        = var.key_vault
#   resource_group_name         = azurerm_resource_group.learning.name
#   location                    = azurerm_resource_group.learning.location
#   rbac_authorization_enabled  = false
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get",
#     ]

#     secret_permissions = [
#       "Get",
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
# }

# resource "azurerm_application_insights" "learning" {
#   name                = var.application_insights
#   resource_group_name = azurerm_resource_group.learning.name
#   location            = azurerm_resource_group.learning.location
#   application_type    = "web"
# }

# output "instrumentation_key" {
#   value     = azurerm_application_insights.learning.instrumentation_key
#   sensitive = true
# }

# output "app_id" {
#   value = azurerm_application_insights.learning.app_id
# }

# resource "azurerm_log_analytics_workspace" "learning" {
#   name                = var.log_analytics_workspace
#   location            = azurerm_resource_group.learning.location
#   resource_group_name = azurerm_resource_group.learning.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }