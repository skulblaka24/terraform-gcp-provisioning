variable "region" {
  description = "GCP region targeted"
  default     = "europe-west1"
}

variable "project_name" {
  description = "GCP project targeted"
}

variable "region_zone" {
  description = "GCP zone targeted"
  default     = "europe-west1-c"
}

variable "image" {
  description = "GCP Image to use"
  default     = "debian-cloud/debian-9"
}

variable "instance_type" {
  description = "GCP Machine Type to use"
  default     = "n1-standard-2"
}

variable "ssh_user" {
  description = "instance SSH user"
  default     = "gauth"
}

variable "ssh_pub_key" {
  description = "SSH public key to authorize"
}

variable "node_count" {
  description = "variable to set the wanted number of host"
}

#### Google Firewalling

#variable "external_source_ranges" {
#  type        = list(string)
#  description = "Source range to allow inbound traffic to Consul API"
#  default     = ["0.0.0.0/0"]
#}

# Remember to paste the one-line json into the variable value
# Capital Letters required
variable "GOOGLE_CREDENTIALS" {
  description = "GCP access credentials"
}