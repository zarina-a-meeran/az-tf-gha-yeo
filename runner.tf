resource "azurerm_network_interface" "learning" {
  name                = var.nic
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.learning.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = var.runner_vm
  resource_group_name = azurerm_resource_group.learning.name
  location            = azurerm_resource_group.learning.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.learning.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    # username   = "azureuser"
    # public_key = file("/home/codespace/.ssh/gha_runner_key.pub")

    username   = "azureuser"
    public_key = var.runner_ssh_public_key
  }
}

