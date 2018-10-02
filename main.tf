module "personal-vpc" {
    source = "network"
    name   = "${var.vpc_name}"
    project-id = "${var.project-id}"
    routing_mode = "${var.routing_mode}"
    vpc_desc = "${var.vpc_desc}"
}

module "subnet-personal-vpc" {
  source            = "network-subnet"
  name              = "${var.subnet_name}"
  vpc               = "${module.personal-vpc.self_link}"
  subnetwork-region = "${var.subnetwork_region}"
  ip_cidr_range     = "${var.ip_cidr_range}"
  subnet_count     = "${var.subnet_count}"
  subnet_newbit     = "${var.subnet_newbit}"
  vpc_flow_logs     = "${var.vpc_flow_logs}"
    subnet_desc = "${local.vpc_desc}"
}

module "vpc-cloud-router" {
  source            = "vpc-cloud-router"
  vpc               = "${module.personal-vpc.self_link}"
  cloud_router_name            = "${var.cloud_router_name}"
}
