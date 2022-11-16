provider "google" {
  project = "infoall-devops"
  region = "us-central1"
  zone = "us-central1-c"
  credentials = "${file("serviceaccount.yml")}"
}

resource "google_folder" "DevOps" {
	display_name = "DevOps"
	parent = "organizations/1043198863765"
}

resource "google_folder" "Desenvolvimento" {
	display_name = "Desenvolvimento"
	parent = google_folder.DevOps.name
}

resource "google_folder" "Infraestrutura" {
	display_name = "Infraestrutura"
	parent = google_folder.DevOps.name
}

resource "google_folder" "Seguranca" {
	display_name = "Seguranca"
	parent = google_folder.DevOps.name
}

resource "google_project" "infoall-dev" {
	name = "infoall-dev"
	project_id = "infoall-dev"
	folder_id = google_folder.Desenvolvimento.name
	auto_create_network = false
	billing_account = "014DC4-2CA2F7-BA79B2"
}

resource "google_project" "infoall-infra" {
	name = "infoall-infra"
	project_id = "infoall-infra"
	folder_id = google_folder.Infraestrutura.name
	auto_create_network = false
	billing_account = "014DC4-2CA2F7-BA79B2"
}

resource "google_project" "infoall-seg" {
	name = "infoall-seg"
	project_id = "infoall-seg"
	folder_id = google_folder.Seguranca.name
	auto_create_network = false
	billing_account = "014DC4-2CA2F7-BA79B2"
}
