#variable "vpc_name" { default = "test-vpc" } # this will be generated via create.sh
variable "subnet_name" {
  default = "test-vpc-subnet"
}

variable "ip_cidr_range" {
  default = "10.0.0.0/23"
}

#variable "subnet_count" { default = "5" } # this will be generated via create.sh
variable "subnet_newbit" {
  default = "5"
}

variable "subnetwork_region" {
  default = "europe-west3"
}

variable "region" {
  default = "europe-west3" # Frankfurt 
}

variable "project-name" {
  default = "809904749726"
}

variable "project-id" {
  default = "test1-217014"
}

variable "vpc_desc" {
  default = "This is contains default IDs for VPC"
}

locals {
  vpc_desc = "AppID: ${var.IDs["AppID"]} | BillingID: ${var.IDs["BillingID"]}"
}

variable "routing_mode" {
  default = "GLOBAL"
}

variable "vpc_flow_logs" {
  default = "true"
}

#Cloud router related variables
variable "cloud_router_name" {
  default = "test-gcp-router"
}

variable "IDs" {
  description = "Map All the related IDs together"
  type        = "map"

  default = {
    AppID      = "1"
    BillingID  = "2"
    WhateverID = "3"
    OneMoreID  = "4"
  }
}

variable "vpc_name" {
  default = "test4"
}

variable "subnet_count" {
  default = "2"
}
