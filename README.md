# terraform-demo

Terraform demo

## GCP setup

To run Terraform, you will be running it as your Google SA account.  To accomplish this, you will need to activate **Application Default Credentials** on your local `gcloud` installation.  More information can be found at [https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)

If you need a default project (i.e. quota project) when setting up `gcloud`, the `broad-terraform-basec-demo` is probably a good project to use as everyone's Google account should have owner access and thus be able to use it for billing.
