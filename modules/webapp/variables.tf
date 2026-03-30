variable "app_name" {
  description = "Nombre de la aplicacion, usado como prefijo en los recursos"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ports" {
  description = "Lista de puertos permitidos en las reglas de ingress del Security Group"
  type        = list(number)
  default     = [80, 443]
}

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet donde se desplegara la instancia"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC para el Security Group"
  type        = string
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}
