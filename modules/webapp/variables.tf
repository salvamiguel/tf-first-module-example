variable "app_name" {
  description = "Nombre de la aplicacion, usado como prefijo en los recursos"
  type        = string
}

variable "vm_size" {
  description = "Tamano de la maquina virtual"
  type        = string
  default     = "Standard_B1s"
}

variable "allowed_ports" {
  description = "Lista de puertos permitidos en las reglas del NSG"
  type        = list(number)
  default     = [80, 443]
}

variable "source_image" {
  description = "Imagen del SO en formato publisher:offer:sku:version"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "resource_group_name" {
  description = "Nombre del Resource Group"
  type        = string
}

variable "location" {
  description = "Region de Azure"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet donde desplegar la VM"
  type        = string
}

variable "admin_username" {
  description = "Nombre de usuario administrador de la VM"
  type        = string
  default     = "adminuser"
}

variable "admin_ssh_public_key" {
  description = "Clave publica SSH para acceso a la VM"
  type        = string
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}
