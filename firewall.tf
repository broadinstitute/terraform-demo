# Firewall rules for the project.

resource "google_compute_firewall" "demo_broad_allow_icmp" {
  name    = "demo-broad-allow-icmp"
  network = google_compute_network.demo.name

  allow {
    protocol = "icmp"
  }

  source_ranges = var.broad_range
}

resource "google_compute_firewall" "demo_broad_allow_ssh" {
  name    = "demo-broad-allow-ssh"
  network = google_compute_network.demo.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.broad_range
}

# Only open web ports if a VM has the tag "web"
resource "google_compute_firewall" "demo_broad_allow_http" {
  name    = "demo-broad-allow-http"
  network = google_compute_network.demo.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.broad_range
  target_tags   = ["web"]
}

resource "google_compute_firewall" "demo_broad_allow_https" {
  name    = "demo-broad-allow-https"
  network = google_compute_network.demo.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = var.broad_range
  target_tags   = ["web"]
}
