# Print out the tfe node IPs.
output "gcp_instances_external_ip" {
  value = module.vm_compute_instance.gcp_instances_tfe_ip
}
