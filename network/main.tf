resource "google_compute_network" "network" {
  name                    = "${var.name}"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
  description             = "${var.vpc_desc}"
  routing_mode            = "${var.routing_mode}"
  #	provisioner "local-exec" {
  #	    command = "gcloud -q compute networks delete default --project=${var.project-id}"
  #  }
}
