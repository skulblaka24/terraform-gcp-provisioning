# Configure the Google Cloud provider
provider "google" {
  region  = var.region
  project = var.project_name
}

resource "google_compute_address" "tfe-ip-addresses" {
  name  = "tfe-ip-${count.index}"
  count = var.node_count
}

# Google Cloud Engine instance creation.
# https://cloud.google.com/compute/docs/machine-types
# https://cloud.google.com/compute/docs/regions-zones
resource "google_compute_instance" "tfe" {
  name                      = "machine-de-test-${count.index}"
  machine_type              = var.instance_type
  zone                      = var.region_zone
  allow_stopping_for_update = true

  tags = ["tfe"]

  boot_disk {
    initialize_params {
      image = var.image
      size = 40
    }
  }

  network_interface {
    network = "default"
    "paloaltonetwork1"

    access_config {
      # Static IP
      nat_ip = element(
        google_compute_address.tfe-ip-addresses.*.address,
        count.index,
      )
    }
  }

  metadata = {
    sshKeys   = "${var.ssh_user}:${var.ssh_pub_key}"
    # startup_script for debian.
    startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python dnsutils libcap2-bin"
  }

  # Label used by tfe GCP Auth GCE role to allow Instance Authentication.
  labels = {
    auth = "yes",
    instance_type = "tfe"
  }

  count = var.node_count
}
























