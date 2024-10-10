data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
  
}

data "azurerm_network_interface" "az_network_interface" {
    resource_group_name = var.resource_group_name
    name = var.network_interface_name
}
data "azurerm_storage_account" "az_storage_account" {
  resource_group_name = var.resource_group_name
  name = var.storage_account_name
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "az_linux_vm" {
  name                  = var.vm_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [data.azurerm_network_interface.az_network_interface.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = var.username

  admin_ssh_key {
    username   = var.username
    public_key = azapi_resource_action.ssh_public_key_gen.output.publicKey
  }

  boot_diagnostics {
    storage_account_uri = data.azurerm_storage_account.az_storage_account.primary_blob_endpoint
  }
  
}

# Generates random names that are intended to be used as unique identifiers for other resources
resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = var.resource_group_location
  parent_id = data.azurerm_resource_group.rg.id
}

resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"
  response_export_values = ["publicKey", "privateKey"]
}

output "key_data" {
  value = azapi_resource_action.ssh_public_key_gen.output.publicKey
}