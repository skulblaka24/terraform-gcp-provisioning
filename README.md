terraform-gcp-provisioning
==========================

Example to provision a vm on GCP and some firewall rules using home made modules.

Modify variables to use it.

Terraform Cloud deployment through Doormat:
-------------------------------------------

Doormat does not seem to handle well the injection of GCP credentials.

So after creating your temporary project, go to "IAM & Admin" then "Service Accounts".
Click on your "Service Account" then "Keys" and "Add Key".

A file will be downloaded with your key.

Inject that JSON block into the TFC workspace interface for variables as GOOGLE_CREDENTIALS and tagged as Sensitive !

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
```

