# Secret values in Google Secret Manager (GSM)

# Secret policies
data "google_iam_policy" "secrets_admin" {
  binding {
    role    = "roles/secretmanager.admin"
    members = [
      "group:devnull@broadinstitute.org",
    ]
  }
}

# Creating a secret only creates a 'bucket' in which you can put a secret value.
# You need to use the gcloud CLI to add a secret 'version' (i.e. the actual secret value).
# gcloud secrets create test_secret
resource "google_secret_manager_secret" "test_secret" {
  secret_id  = "test_secret"
  depends_on = [ google_project_service.secret_manager ]
  labels     = {
    vendor = "abc",
    status = "123"
  }

  replication {
    user_managed {
      replicas {
        location = "us-east1"
      }
      replicas {
        location = "us-east4"
      }
    }
  }
}
# This attaches the default 'secrets_admin' policy created above to the secret to protect it
resource "google_secret_manager_secret_iam_policy" "test_secret" {
  project = google_secret_manager_secret.test_secret.project
  secret_id = google_secret_manager_secret.test_secret.secret_id
  policy_data = data.google_iam_policy.secrets_admin.policy_data
}

# This allows the provided service account (created in service-accounts.tf) to access (read)
# the secret, but it can make no other changes to the secret
# data "google_iam_policy" "secret_accessor" {
#   binding {
#     role    = "roles/secretmanager.secretAccessor"
#     members = [
#       format("serviceAccount:%s", google_service_account.demo_test.email),
#     ]
#   }
# }
