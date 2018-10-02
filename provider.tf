provider "google" {
  credentials = "${file("credentials/account.json")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}
