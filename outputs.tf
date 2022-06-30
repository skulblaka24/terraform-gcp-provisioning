# Print out the tfe node IPs.
output "gcp_instances_vm_ip" {
  value = module.vm_compute_instance.google_compute_instance.tfe.*.network_interface.0.access_config.0.nat_ip
}
