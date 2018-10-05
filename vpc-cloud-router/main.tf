

resource "google_compute_router" "cloud_router_region1" {
  count = "${var.vpc_router_count}"
  name    = "${var.vpc_router_name}-region1-${count.index}"
  network = "${var.vpc}"
  description = "${var.vpc_router_desc}"
  region = "${var.vpc_router_region1}"
  bgp {
    asn               = "${var.vpc_router_bgp_asn}"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "${var.vpc_router_advertised_ip_range}"
    }
  }
}

resource "google_compute_router" "cloud_router_region2" {
  count = "${var.vpc_router_count}"
  name    = "${var.vpc_router_name}-region2-${count.index}"
  network = "${var.vpc}"
  description = "${var.vpc_router_desc}"
  region = "${var.vpc_router_region1}"
  bgp {
    asn               = "${var.vpc_router_bgp_asn}"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "${var.vpc_router_advertised_ip_range}"
    }
  }
}


resource "google_compute_router_peer" "cloud_router_peers_region1" {
  count = "${var.vpc_router_count}"
  name                      = "${var.vpc_router_peer1_name}-${count.index}"
  router                    = "${var.vpc_router_name}-region1-${count.index}"
  peer_ip_address           = "${var.vpc_router_peer1_ip_address}"
  peer_asn                  = "${var.vpc_router_peer1_asn}"
  advertised_route_priority = "${var.vpc_router_peer1_advertised_route_priority}"
  interface                 = "interface-1"
  depends_on = [ "google_compute_router.cloud_router_region1" ]
}

resource "google_compute_router_peer" "cloud_router_peers_region2" {
  count = "${var.vpc_router_count}"
  name                      = "${var.vpc_router_peer1_name}-${count.index}"
  router                    = "${var.vpc_router_name}-region2-${count.index}"
  router                    = "${var.vpc_router_name}-region2-${count.index}"
  peer_ip_address           = "${var.vpc_router_peer1_ip_address}"
  peer_asn                  = "${var.vpc_router_peer1_asn}"
  advertised_route_priority = "${var.vpc_router_peer1_advertised_route_priority}"
  interface                 = "interface-1"
  depends_on = [ "google_compute_router.cloud_router_region2" ]
}
