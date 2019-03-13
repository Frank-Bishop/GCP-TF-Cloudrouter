output "small_subnet_gateway_address" {
  value       = "${google_compute_subnetwork.small_subnetwork.*.gateway_address}"
  description = "The IP address of the gateway."
}
output "big_subnet_gateway_address" {
  value       = "${google_compute_subnetwork.big_subnetwork.*.gateway_address}"
  description = "The IP address of the gateway."
}
#output "self_link" {
#  value       = "${google_compute_subnetwork.subnetwork.self_link}"
#  description = "The URL of the created resource"
#}
output "small_subnet_id_${count.index}" {
  value = ["${google_compute_subnetwork.small_subnetwork.*.id}"]
}

output "big_subnet_id_${count.index}" {
  value = ["${google_compute_subnetwork.big_subnetwork.*.id}"]
}
