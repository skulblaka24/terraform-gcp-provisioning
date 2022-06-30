terraform-gcp-provisioning
==========================

Example to provision a vm on GCP and some firewall rules using home made modules.

Modify variables to use it.

For example, add "GOOGLE_CREDENTIALS" to be able to connect to GCP in TFC or use Doormat.

Variable available:
-------------------

```
region = "europe-west1"
region_zone = "europe-west1-c"
project_name = "starfly-lab-290613"
node_count = "1"
image = "debian-cloud/debian-9"
ssh_user = "gauth"
ssh_pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBd8AerMuCVlT1ERPifxLdJ4ctQATQX6XMrzpQLK1kf gauth@starfly.fr"
instance_type = "n1-standard-2"
``

