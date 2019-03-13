resource "google_compute_subnetwork" "small_subnetwork" {
  region           = "${var.region}"
  name             = "${var.name}-small-auto-${count.index}"
  count            = "${var.small_subnet_count}"
  description      = "${var.subnet_desc}"
  network          = "${var.vpc}"
  enable_flow_logs = "${var.vpc_flow_logs}"
#  ip_cidr_range    = "${cidrsubnet(var.ip_cidr_range, 5, count.index)}"
  ip_cidr_range = "${cidrsubnet(lookup(var.subnet_allocation_map, "small"), lookup(var.newbit_size,"small"),2 + count.index)}"
}
resource "google_compute_subnetwork" "big_subnetwork" {
  region           = "${var.region}"
  name             = "${var.name}-big-auto-${count.index}"
  count            = "${var.big_subnet_count}"
  description      = "${var.subnet_desc}"
  network          = "${var.vpc}"
  enable_flow_logs = "${var.vpc_flow_logs}"
#  ip_cidr_range    = "${cidrsubnet(var.ip_cidr_range, 3, count.index)}"
  ip_cidr_range = "${cidrsubnet(lookup(var.subnet_allocation_map, "large"), lookup(var.newbit_size,"large"),2 + count.index)}"
}
resource "google_compute_subnetwork" "list_subnetwork" {
  region           = "${var.region}"
  name             = "${var.name}-list-${count.index}"
  count            = "${length(var.subnets)}"
  description      = "${var.subnet_desc}"
  network          = "${var.vpc}"
  enable_flow_logs = "${var.vpc_flow_logs}"
  ip_cidr_range    = "${element(var.subnets, count.index)}"
}
