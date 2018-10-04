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

resource "google_compute_router_peer" "cloud_router_peer1" {
  name                      = "${var.vpc_router_peer1_name}"
  router                    = "${var.vpc_router_name}"
  peer_ip_address           = "${var.vpc_router_peer1_ip_address}"
  peer_asn                  = "${var.vpc_router_peer1_asn}"
  advertised_route_priority = "${var.vpc_router_peer1_advertised_route_priority}"
  interface                 = "interface-1"
  depends_on = [ "google_compute_router.cloud_router" ]
}