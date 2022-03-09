# Configure project-level settings

data "google_iam_policy" "admin" {
  binding {
    role    = "roles/owner"

    members = [
      "group:devnull@broadinstitute.org",
    ]
  }

  binding {
    role = "roles/compute.osLogin"

    members = [
      "group:devnull@broadinstitute.org",
    ]
  }

  binding {
    role = "roles/compute.osAdminLogin"

    members = [
      "group:devnull@broadinstitute.org",
    ]
  }
}

resource "google_project_iam_policy" "default_policy" {
  project     = var.project
  policy_data = data.google_iam_policy.admin.policy_data
}
