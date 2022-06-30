terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

# Configure the Google Cloud provider
provider "google" {
  region  = var.region
  project = var.project_name
}

module "vm_compute_instance" {
  source  = "github.com/skulblaka24/terraform-module-gcp-compute"

  region_zone = var.region_zone
  node_count = var.node_count
  ssh_pub_key = var.ssh_pub_key
  ssh_user = var.ssh_user
  image = var.image
  instance_type = var.instance_type
}

module "vm_firewall_rules" {
  source  = "github.com/skulblaka24/terraform-module-gcp-fw"
}