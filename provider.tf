# Provider configuration

# Provider documentation: https://registry.terraform.io/providers/hashicorp/google/latest/docs

provider "google" {
  project = var.project
  region  = var.region
}

# Turn on some APIs
# Get the full list of service URLs from: gcloud services list --available
resource "google_project_service" "compute" {
  project = var.project
  service = "compute.googleapis.com"
}
resource "google_project_service" "secret_manager" {
  project = var.project
  service = "secretmanager.googleapis.com"
}
