variable "app_name" {
  description = "Nombre de la aplicacion, usado como prefijo en los recursos"
  type        = string
}

variable "instance_type" {
  description = "Tipo/tamano de la instancia (varia segun provider)"
  type        = string
}

variable "allowed_ports" {
  description = "Lista de puertos permitidos en las reglas de firewall"
  type        = list(number)
  default     = [80, 443]
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}
