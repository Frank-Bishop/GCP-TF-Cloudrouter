
#Router related variables

variable "vpc" { }
variable "vpc_router_name" { }
variable "vpc_router_count" { }
variable "vpc_router_desc" { }
variable "vpc_router_bgp_asn" { }
variable "vpc_router_advertised_ip_range" { }
variable "vpc_router_region1" { }
variable "vpc_router_region2" { }

#Peer related variables

variable "vpc_router_peer1_name" { }
variable "vpc_router_peer1_ip_address" { }
variable "vpc_router_peer1_asn" { }
variable "vpc_router_peer1_advertised_route_priority" { }