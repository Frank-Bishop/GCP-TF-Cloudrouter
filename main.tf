module "personal-vpc" {
  source       = "network"
  name         = "${var.vpc_name}"
  project-id   = "${var.project-id}"
  routing_mode = "${var.routing_mode}"
  vpc_desc     = "${var.vpc_desc}"
}

module "subnet-personal-vpc" {
  source            = "network-subnet"
  name              = "${var.subnet_name}"
  vpc               = "${module.personal-vpc.self_link}"
  region = "${var.subnetwork_region1}"
  ip_cidr_range     = "${var.ip_cidr_range}"
  subnet_count      = "${var.subnet_count}"
  subnet_newbit     = "${var.subnet_newbit}"
  vpc_flow_logs     = "${var.vpc_flow_logs}"
  subnet_desc       = "${local.vpc_desc}"
}

module "vpc-cloud-router" {
  source            = "vpc-cloud-router"
  vpc               = "${module.personal-vpc.self_link}"
  vpc_router_name = "${var.vpc_router_name}"
    vpc_router_count = "${var.vpc_router_count}"
    vpc_router_desc = "${var.vpc_router_desc}"
    vpc_router_bgp_asn = "${var.vpc_router_bgp_asn}"
    vpc_router_advertised_ip_range = "${local.vpc_router_advertised_ip_range}"
    vpc_router_region1 = "${var.vpc_router_region1}"
    vpc_router_region2 = "${var.vpc_router_region2}"

    vpc_router_peer1_name = "${var.vpc_router_peer_name}"
    vpc_router_peer1_ip_address = "${var.vpc_router_peer_ip_address}"
    vpc_router_peer1_asn = "${var.vpc_router_peer_asn}"
    vpc_router_peer1_advertised_route_priority = "${var.vpc_router_peer_advertised_route_priority}"

    vpc_router_peer2_name = "${var.vpc_router_peer2_name}"
    vpc_router_peer2_ip_address = "${var.vpc_router_peer2_ip_address}"
    vpc_router_peer2_asn = "${var.vpc_router_peer2_asn}"
    vpc_router_peer2_advertised_route_priority = "${var.vpc_router_peer2_advertised_route_priority}"

}


resource "google_compute_firewall" "ssh" {
  name    = "${var.vpc_name}-firewall"
  network = "${var.vpc_name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

#  allow {
#    protocol = "tcp"
#    ports    = ["80"]
#  }
#
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags   = ["${var.vpc_name}-firewall-ssh"]
  source_ranges = ["0.0.0.0/0"]

}



module "vpn-module-dynamic" {
  source  = "terraform-google-modules/vpn/google"
  version = "0.2.0"

  project_id               = "${var.project-id}"
  network                  = "${var.vpc_name}"
  region                   = "${var.vpc_router_region1}"
  gateway_name             = "vpn-gw-us-we1-dynamic"
  tunnel_name_prefix       = "vpn-tn-us-we1-dynamic"  
  shared_secret            = "secrets"
  tunnel_count             = 1
  peer_ips                 = ["195.228.45.144","84.2.3.210"]

  cr_name                  = "${var.vpc_router_name}-region1-0"
  bgp_cr_session_range     = ["169.254.0.1/30", "169.254.1.4/30"]
  bgp_remote_session_range = ["169.254.0.2", "169.254.1.5"]
  peer_asn                 = [ "${var.vpc_router_peer_asn}", "${var.vpc_router_peer_asn}" ]
}

module "vpn-module-dynamic-2" {
  source  = "terraform-google-modules/vpn/google"
  version = "0.2.0"

  project_id               = "${var.project-id}"
  network                  = "${var.vpc_name}"
  region                   = "${var.vpc_router_region2}"
  gateway_name             = "vpn-gw-us-we2-dynamic"
  tunnel_name_prefix       = "vpn-tn-us-we2-dynamic"  
  shared_secret            = "secrets"
  tunnel_count             = 1
  peer_ips                 = ["195.228.45.144","84.2.3.210"]

  cr_name                  = "${var.vpc_router_name}-region2-0"
  bgp_cr_session_range     = ["169.254.10.1/30", "169.254.10.4/30"]
  bgp_remote_session_range = ["169.254.10.2", "169.254.10.5"]
  peer_asn                 = ["${var.vpc_router_peer2_asn}", "${var.vpc_router_peer2_asn}"]
}
