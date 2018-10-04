#Network related variables

variable "subnet_name" { default = "project-vpc-subnet" }
variable "ip_cidr_range" { default = "10.0.0.0/23" }
variable "subnet_newbit" { default = "5" }
variable "subnetwork_region1" { default = "europe-west2" }

variable "region" { 
type    = "list" 
default = [ "europe-west2", "europe-west3" ]

}

variable "region1" { default = "europe-west1" }
variable "project-name" { default = "809904749726" }
variable "project-id" { default = "test1-217014" }
variable "vpc_desc" { default = "This is contains default IDs for VPC" }

locals {
  vpc_desc = "AppID: ${var.IDs["AppID"]} | BillingID: ${var.IDs["BillingID"]} | AppName: ${var.IDs["AppName"]} | Environment: ${var.IDs["Environment"]}  | CSIAppID: ${var.IDs["CSIAppID"]}"
}

variable "routing_mode" { default = "GLOBAL" }
variable "vpc_flow_logs" { default = "true" }

#Cloud router related variables

variable "vpc_router_name" { default = "test-gcp-router"}
variable "vpc_router_desc" { default = "test-description_NEW" }
variable "vpc_router_bgp_asn" { default = "65515" }
locals { vpc_router_advertised_ip_range = "${var.ip_cidr_range}" }

#Peer related variables

variable "vpc_router_peer1_name" { default = "testpeer1" }
variable "vpc_router_peer1_ip_address" { default = "10.1.2.3" }
variable "vpc_router_peer1_asn" { default = "65444"}
variable "vpc_router_peer1_advertised_route_priority" { default = "100" }


variable "IDs" {
  description = "Map All the related IDs together"
  type        = "map"

  default = {
    AppID      = "1"
    BillingID  = "2"
    AppName  = "3"
    Environment  = "2"
    CSIAppID  = "2"
    CTIResourceAudit  = "2"
    StartDate  = "2"
    PublicRouted  = "NO"
    InstalledSoftware  = "2"
    ExpiryDateTime  = "2"
  }
}

variable "vpc_name" { default = "test5" }
variable "subnet_count" { default = "5" }

