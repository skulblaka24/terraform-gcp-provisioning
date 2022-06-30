terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }

    doormat = {
      source  = "doormat.hashicorp.services/hashicorp-security/doormat"
      version = "~> 0.0.2"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "gauth"

    workspaces {
      name = "terraform-gcp-provisioning"
    }
  }
}

provider "doormat" {}

data "doormat_gcp_credentials" "creds" {
  provider = doormat

  service_account = var.service_account_email
  project_id      = var.project_name
}

# Configure the Google Cloud provider
provider "google" {
  region  = var.region
  project = var.project_name
  access_token = data.doormat_gcp_credentials.creds.access_token
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
