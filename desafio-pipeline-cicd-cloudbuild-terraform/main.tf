terraform {
  required_providers {
    google = {
      source = "hashicorp/google"  
    }
  }

  backend "gcs" {
    bucket = "infoallterraform"  
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "infoall-devops"
  region  = "europe-west1"
  zone    = "europe-west1-b"  
}

resource "google_compute_network" "vpc_network" {
  name = "${var.network_name}"
}

resource "google_compute_instance" "infoall_terraform" {
  name         = "infoall-terraform"     
  machine_type = "e2-medium"
  tags         = ["prod"]
  
  labels = {
    infoall_devops = "${var.infoall_devops}"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    } 
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
