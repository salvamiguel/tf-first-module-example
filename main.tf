provider "aws" {
  region = "eu-west-1"
}

module "webapp" {
  source = "./modules/webapp"

  app_name      = "mi-webapp"
  instance_type = "t2.micro"
  ami_id        = "ami-0c38b837cd80f13bb"
  subnet_id     = "subnet-xxxxxxxx"
  vpc_id        = "vpc-xxxxxxxx"
  allowed_ports = [80, 443]

  tags = {
    Environment = "dev"
    Project     = "ejemplo-modulos"
  }
}

output "webapp_public_ip" {
  value = module.webapp.public_ip
}

output "webapp_instance_id" {
  value = module.webapp.instance_id
}
