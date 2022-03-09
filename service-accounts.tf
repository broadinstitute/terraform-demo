# Service account definitions

# Create a demo service account that can be used to access secrets
resource "google_service_account" "demo_test" {
  account_id   = "demo-test"
  display_name = "Demo service account"
  description  = "Accessor for secrets"
}
