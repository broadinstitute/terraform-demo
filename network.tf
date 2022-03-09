# This sets up any networks and subnetworks that are needed in the project.

resource "google_compute_network" "demo" {
  name                    = "demo"
  auto_create_subnetworks = false

  # We **really** don't want the network to be deleted by accident!!
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_subnetwork" "demo_subnet1" {
  name          = format("demo-%s", var.region)
  ip_cidr_range = var.internal_range
  network       = google_compute_network.demo.self_link
  region        = var.region

  lifecycle {
    prevent_destroy = true
  }

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
