output "gateway_address" {
  value       = "${google_compute_subnetwork.subnetwork.*.gateway_address}"
  description = "The IP address of the gateway."
}
#output "self_link" {
#  value       = "${google_compute_subnetwork.subnetwork.self_link}"
#  description = "The URL of the created resource"
#}
output "subnet_id_${count.index}" {
  value = ["${google_compute_subnetwork.subnetwork.*.id}"]
}
