#Network related variables

variable "subnet_name" { default = "project-vpc-subnet" }
variable "ip_cidr_range" { default = "192.168.0.0/22" }
variable "subnet_newbit" { default = "5" }
variable "subnetwork_region1" { default = "europe-west2" }

variable "router_region" { 
type    = "list" 
default = [ "europe-west2", "europe-west3" ]
}

#labels = { environment = "dev" } # Only works for Instances

# VPC related parameters
variable "region1" { default = "europe-west1" }
variable "project-name" { default = "809904749726" }
variable "project-id" { default = "test1-217014" }
variable "vpc_desc" { default = "This is contains default IDs for VPC" }

# Locals for combining the variables together - for description fields - 
locals {
  vpc_desc = "AppID: ${var.IDs["AppID"]} | BillingID: ${var.IDs["BillingID"]} | AppName: ${var.IDs["AppName"]} | Environment: ${var.IDs["Environment"]}  | CSIAppID: ${var.IDs["CSIAppID"]}"
}

locals {
  vpc_name = "${var.IDs["AppID"]}-${var.IDs["BillingID"]}-${var.IDs["AppName"]}-${var.IDs["Environment"]}-${var.IDs["CSIAppID"]}"
}

variable "routing_mode" { default = "GLOBAL" }
variable "vpc_flow_logs" { default = "true" }

#Cloud router related variables

#router regions
variable "vpc_router_region1" { default = "europe-west1" }
variable "vpc_router_region2" { default = "europe-west2" }

#number of CLoud routers per region
variable "vpc_router_count" { default = "1" }
variable "vpc_router_name" { default = "test-gcp-router" }
variable "vpc_router_desc" { default = "test-description_NEW" }
variable "vpc_router_bgp_asn" { default = "65410" }
locals { vpc_router_advertised_ip_range = "${var.ip_cidr_range}" }


#Peer1 related variables

variable "vpc_router_peer_name" { default = "testpeer1" }
variable "vpc_router_peer_ip_address" { default = "10.1.2.3" }
variable "vpc_router_peer_asn" { default = "2911"}
variable "vpc_router_peer_advertised_route_priority" { default = "100" }


#Peer2 related variables

variable "vpc_router_peer2_name" { default = "testpeer1" }
variable "vpc_router_peer2_ip_address" { default = "10.20.30.40" }
variable "vpc_router_peer2_asn" { default = "2911"}
variable "vpc_router_peer2_advertised_route_priority" { default = "100" }


#Company related ID's - this will represent within the "desfription field's"
variable "IDs" {
  description = "Map All the related IDs together"
  type        = "map"

  default = {
    AppID      = "appid1"
    BillingID  = "billingid1"
    AppName  = "testname1"
    Environment  = "dev"
    CSIAppID  = "csiappid1"
    CTIResourceAudit  = "6"
    StartDate  = "7"
    PublicRouted  = "NO"
    InstalledSoftware  = "9"
    ExpiryDateTime  = "10"
  }
}

variable subnet_allocation_map {
  description = "Map of CIDR blocks to carve into subnets based on size"
#  type = map
  default = {
    xsmall = "10.1.0.0/24"
    small  = "10.1.2.0/24"
    medium = "10.1.3.0/24"
    large  = "10.1.4.0/24"
   }
}

variable "newbit_size" {
  description = "Map the friendly name to our subnet bit mask"
  type        = "map"
  default = {
    xsmall = "6"
    small  = "5"
    medium = "4"
    large  = "3"
  }
}

variable "subnets" { default =  [ "10.1.0.0/24", "10.1.2.0/24", "10.1.3.0/24" ,"10.1.4.0/28", "10.1.4.16/28" ] }

#Script generetaed values coming from here - comment out whan using in production
#variable "vpc_name" { default = "terraform-demo-new" }
#variable "subnet_count" { default = "2" }

variable "vpc_name" { default = "techsess-2" }
variable "small_subnet_count" { default = "4" }
variable "big_subnet_count" { default = "0" }
