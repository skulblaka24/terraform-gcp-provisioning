resource "google_compute_firewall" "allow-inbound-tfe-replicated" {
  name    = "allow-inbound-tfe-replicated-2"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8800"]
  }

  target_tags = ["tfe"]
}

# To allow hybrid environnement and connect outside cluster to this one.
resource "google_compute_firewall" "allow-inbound-tfe-admin" {
  name    = "allow-inbound-tfe-admin"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["32846"]
  }

  target_tags = ["tfe"]
}

resource "google_compute_firewall" "allow-inbound-nginx" {
  name    = "allow-inbound-nginx"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = ["tfe"]
}

