output "instance_id" {
  description = "ID de la instancia de Compute Engine"
  value       = google_compute_instance.this.instance_id
}

output "public_ip" {
  description = "IP publica de la instancia"
  value       = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}

output "private_ip" {
  description = "IP privada de la instancia"
  value       = google_compute_instance.this.network_interface[0].network_ip
}

output "firewall_id" {
  description = "ID de la regla de firewall"
  value       = google_compute_firewall.this.id
}
