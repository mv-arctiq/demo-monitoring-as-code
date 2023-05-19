terraform {
  backend "gcs" {
    bucket = "demo-terraform-dynatrace"
    prefix = "my-team/stage"
  }
}
