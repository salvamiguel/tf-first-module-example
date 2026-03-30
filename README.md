# Terraform First Module Example

Ejemplo practico de un modulo Terraform reutilizable (`webapp`) implementado para tres cloud providers.

## Estructura

```
modules/webapp/
├── main.tf          # Recursos principales
├── variables.tf     # Variables de entrada
├── outputs.tf       # Valores de salida
└── versions.tf      # Requisitos de provider

main.tf              # Ejemplo de uso del modulo (root)
```

## Ramas por Provider

Cada rama contiene la implementacion completa del modulo para un provider especifico:

| Rama    | Provider | Recursos principales                          |
|---------|----------|-----------------------------------------------|
| `aws`   | AWS      | EC2 Instance + Security Group                 |
| `gcp`   | GCP      | Compute Instance + Firewall                   |
| `azure` | Azure    | Linux Virtual Machine + Network Security Group|

## Uso

```bash
# Clonar el repo
git clone <url>

# Cambiar a la rama del provider deseado
git checkout aws    # o gcp, azure

# Inicializar y aplicar
terraform init
terraform plan
terraform apply
```

## Variables comunes

Todas las implementaciones comparten la misma interfaz conceptual:

| Variable        | Descripcion                              |
|-----------------|------------------------------------------|
| `app_name`      | Prefijo para nombres de recursos         |
| `instance_type` | Tipo/tamano de la instancia              |
| `allowed_ports` | Puertos permitidos en el firewall        |
| `tags`          | Etiquetas adicionales para los recursos  |
