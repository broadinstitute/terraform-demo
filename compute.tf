# Compute (VM) example
#

resource "google_compute_address" "demo" {
  name  = "demo"
}

# tfsec:ignore:google-compute-no-default-service-account
# tfsec:ignore:google-compute-no-project-wide-ssh-keys
# tfsec:ignore:google-compute-no-public-ip
# tfsec:ignore:google-compute-vm-disk-encryption-customer-key
resource "google_compute_instance" "demo" {
  name         = "demo"
  machine_type = var.instance_size_demo
  zone         = var.zone

  # Local OS disk
  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.platform
      size  = var.disk_size_root
    }
  }

  timeouts {
    create = "4m"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.demo_subnet1.name
    access_config {
      nat_ip = google_compute_address.demo.address
    }
  }

  service_account {
    scopes = var.scopes_default
  }
}
