terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  backend "remote" {
    organization = "lonnblad"

    workspaces {
      name = "lonnblad-dot-com-dns"
    }
  }
}

variable "google_credentials" {
  type        = string
  description = "The Google Cloud Platform Credentials to be used to manage resources."
}

// Configure the Google Cloud provider
provider "google" {
  credentials = var.google_credentials
  project     = "core"
  region      = "europe-west1"
}
