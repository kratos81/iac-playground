

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  #credentials = file("~/iac-playground/key.json")
  project = "infra-as-code-1981"
  region  = "us-central1"
  zone    = "us-central1-c"
}

data "google_compute_image" "test-image" {
  project  = "infra-as-code-1981"
  name     = "infra-test"
}

resource "google_compute_instance" "infra-test" {
  name         = "infra-test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.test-image.self_link
    }
  }

  network_interface {
    network = "default"
  }
}