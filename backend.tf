# State backend
terraform {
  backend "gcs" {
    bucket = "broad-terraform-basec-demo"
    prefix = "terraform.tfstate"
  }
}
