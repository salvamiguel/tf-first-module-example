locals {
  common_labels = merge(
    {
      application = var.app_name
      managed-by  = "terraform"
    },
    var.tags
  )
}

resource "google_compute_firewall" "this" {
  name    = "${var.app_name}-allow-web"
  network = var.network

  dynamic "allow" {
    for_each = var.allowed_ports
    content {
      protocol = "tcp"
      ports    = [allow.value]
    }
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.app_name}-web"]
}

resource "google_compute_instance" "this" {
  name         = "${var.app_name}-instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {}
  }

  tags   = ["${var.app_name}-web"]
  labels = local.common_labels
}
