resource "google_compute_router" "cloud_router" {
  name    = "${var.vpc_router_name}"
  network = "${var.vpc}"
  description = "${var.vpc_router_desc}"
  bgp {
    asn               = "${var.vpc_router_bgp_asn}"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]

    advertised_ip_ranges {
      range = "${var.vpc_router_advertised_ip_range}"
    }
  }
}
