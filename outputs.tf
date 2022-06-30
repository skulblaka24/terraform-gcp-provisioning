# Print out the tfe node IPs.
output "gcp_instances_vm_ip" {
  value = module.vm_compute_instance.gcp_instances_vm_ip
}
