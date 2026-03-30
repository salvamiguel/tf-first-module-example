output "vm_id" {
  description = "ID de la maquina virtual"
  value       = azurerm_linux_virtual_machine.this.id
}

output "private_ip" {
  description = "IP privada de la VM"
  value       = azurerm_network_interface.this.private_ip_address
}

output "network_interface_id" {
  description = "ID de la interfaz de red"
  value       = azurerm_network_interface.this.id
}

output "nsg_id" {
  description = "ID del Network Security Group"
  value       = azurerm_network_security_group.this.id
}
