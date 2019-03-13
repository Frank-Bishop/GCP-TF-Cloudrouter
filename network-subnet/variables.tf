variable "name" {}
variable "vpc" {}
variable "region" {}
variable "subnet_desc" {}
variable "ip_cidr_range" {}
variable "subnet_newbit" {}
variable "small_subnet_count" {}
variable "big_subnet_count" {}
variable "vpc_flow_logs" {}
variable "subnet_allocation_map" {type        = "map"} 
variable "newbit_size" { type        = "map" }
variable "subnets" { type        = "list" }
