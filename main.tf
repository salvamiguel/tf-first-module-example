provider "google" {
  project = "mi-proyecto-gcp"
  region  = "europe-west1"
}

module "webapp" {
  source = "./modules/webapp"

  app_name     = "mi-webapp"
  machine_type = "e2-micro"
  image        = "debian-cloud/debian-12"
  subnetwork   = "default"
  zone         = "europe-west1-b"

  allowed_ports = [80, 443]

  tags = {
    environment = "dev"
    project     = "ejemplo-modulos"
  }
}

output "webapp_public_ip" {
  value = module.webapp.public_ip
}

output "webapp_instance_id" {
  value = module.webapp.instance_id
}
