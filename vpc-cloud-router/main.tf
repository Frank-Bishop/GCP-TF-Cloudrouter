resource "google_compute_router" "cloud_router1" {
  name    = "${var.vpc_router_name}-1"
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

resource "google_compute_router" "cloud_router2" {
  name    = "${var.vpc_router_name}-2"
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


resource "google_compute_router" "cloud_router3" {
  name    = "${var.vpc_router_name}-3"
  network = "${var.vpc}"
  description = "${var.vpc_router_desc}"
  region = "${var.vpc_router_region2}"
  bgp {
    asn               = "${var.vpc_router_bgp_asn}"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    advertised_ip_ranges {
      range = "${var.vpc_router_advertised_ip_range}"
    }
  }
}


resource "google_compute_router" "cloud_router4" {
  name    = "${var.vpc_router_name}-4"
  network = "${var.vpc}"
  description = "${var.vpc_router_desc}"
  region = "${var.vpc_router_region2}"
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
  depends_on = [ "google_compute_router.cloud_router1" ]
}