provider "azurerm" {
  features {}
}

module "webapp" {
  source = "./modules/webapp"

  app_name            = "mi-webapp"
  vm_size             = "Standard_B1s"
  resource_group_name = "mi-resource-group"
  location            = "westeurope"
  subnet_id           = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/virtualNetworks/xxx/subnets/xxx"

  source_image = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_username       = "adminuser"
  admin_ssh_public_key = file("~/.ssh/id_rsa.pub")

  allowed_ports = [80, 443]

  tags = {
    Environment = "dev"
    Project     = "ejemplo-modulos"
  }
}

output "webapp_vm_id" {
  value = module.webapp.vm_id
}

output "webapp_private_ip" {
  value = module.webapp.private_ip
}
