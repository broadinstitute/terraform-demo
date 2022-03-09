# Configure project-level settings

data "google_iam_policy" "admin" {
  binding {
    role    = "roles/owner"

    members = [
      "group:devnull@broadinstitute.org",
    ]
  }

  binding {
    role    = "roles/viewer"

    members = [
      "group:bits@broadinstitute.org",
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

  binding {
    members = [
      "serviceAccount:service-${data.google_project.demo.number}@compute-system.iam.gserviceaccount.com",
    ]
    role    = "roles/compute.serviceAgent"
  }

  binding {
    members = [
        "serviceAccount:${data.google_project.demo.number}-compute@developer.gserviceaccount.com",
        "serviceAccount:${data.google_project.demo.number}@cloudservices.gserviceaccount.com",
      ]
    role    = "roles/editor"
  }
}

resource "google_project_iam_policy" "default_policy" {
  project     = var.project
  policy_data = data.google_iam_policy.admin.policy_data
}
