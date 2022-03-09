# Variables for use throughout

# variable "all_range" {
#   default     = "0.0.0.0/0"
#   description = "The 'everybody' internet range"
#   type        = string
# }

variable "broad_range" {
  default     = [
    "69.173.64.0/19",
    "69.173.96.0/20",
    "69.173.112.0/21",
    "69.173.120.0/22",
    "69.173.124.0/23",
    "69.173.126.0/24",
    "69.173.127.0/25",
    "69.173.127.128/26",
    "69.173.127.192/27",
    "69.173.127.224/30",
    "69.173.127.228/32",
    "69.173.127.230/31",
    "69.173.127.232/29",
    "69.173.127.240/28",
  ]
  description = "The Broad's externally routable network range"
  type        = list
}

variable "disk_size_root" {
  default     = 50
  description = "The default root disk size"
  type        = number
}

variable "instance_size_demo" {
  default     = "g1-small"
  description = "The default instance size for a host"
  type        = string
}

variable "internal_range" {
  default     = "10.255.0.0/24"
  description = "The IP range to create for the internal network"
  type        = string
}

variable "platform" {
  default     = "centos-8-v20211214"
  description = "The default OS platform"
  type        = string
}

variable "project" {
  default     = "broad-terraform-basec-demo"
  description = "The GCS project ID"
  type        = string
}

variable "region" {
  # Get a full list from: gcloud compute regions list
  default     = "us-east1"
  description = "The deployment region"
  type        = string
}

# These are the default scopes we use on most VMs
variable "scopes_default" {
  default = [
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/trace.append",
  ]
  description = "The default scopes for a compute instance"
  type        = list
}

variable "zone" {
  # Get a list of zones for a region by looking at the 'zones' field from:
  # gcloud compute regions describe us-east1
  default     = "us-east1-b"
  description = "The deployment zone"
  type        = string
}
