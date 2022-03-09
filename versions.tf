# Terraform version requirements
terraform {
  required_version = ">= 1.1"

  required_providers {
    google = {
      version = ">= 4.13.0"
      source  = "hashicorp/google"
    }
  }
}
