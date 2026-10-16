resource "azurerm_virtual_network" "learning" {
  name                = var.virtual_network
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "learning" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.learning.name
  virtual_network_name = azurerm_virtual_network.learning.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "learning" {
  name                = var.network_security_group
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name

  # Your security_rule block and tags...
}

resource "azurerm_network_security_rule" "learning" {
  name                        = var.network_security_rule
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.learning.name
  network_security_group_name = azurerm_network_security_group.learning.name
}

resource "azurerm_subnet_network_security_group_association" "learning" {
  subnet_id                 = azurerm_subnet.learning.id
  network_security_group_id = azurerm_network_security_group.learning.id
}