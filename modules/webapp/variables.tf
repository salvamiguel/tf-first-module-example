variable "app_name" {
  description = "Nombre de la aplicacion, usado como prefijo en los recursos"
  type        = string
}

variable "machine_type" {
  description = "Tipo de maquina de Compute Engine"
  type        = string
  default     = "e2-micro"
}

variable "allowed_ports" {
  description = "Lista de puertos permitidos en las reglas de firewall"
  type        = list(number)
  default     = [80, 443]
}

variable "image" {
  description = "Imagen del disco de arranque (ej: debian-cloud/debian-12)"
  type        = string
}

variable "network" {
  description = "Nombre o self_link de la red VPC"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Nombre o self_link de la subred"
  type        = string
}

variable "zone" {
  description = "Zona de GCP donde desplegar la instancia"
  type        = string
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}
