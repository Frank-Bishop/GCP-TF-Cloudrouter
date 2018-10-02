resource "google_compute_router" "cloud_router" {
  name    = "${var.cloud_router_name}"
  network = "${var.vpc}"
#  description "testrouter"
  bgp {
    asn               = 64514
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]

    advertised_ip_ranges {
      range = "1.2.3.4"
    }

    advertised_ip_ranges {
      range = "6.7.0.0/16"
    }
  }
}
