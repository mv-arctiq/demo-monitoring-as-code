terraform {
  required_version = "~> 1.4"
  required_providers {
    dynatrace = {
      source  = "registry.terraform.io/dynatrace-oss/dynatrace"
      version = "~> 1.25.1"
    }
  }
}

