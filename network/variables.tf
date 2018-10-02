variable "name" {
  type        = "string"
#  description = "Test GCP network"
}

variable "project-id" {
  type        = "string"
#  description = "Project Id"
}

variable "auto_create_subnetworks" {
  type        = "string"
  default     = "false"
  description = "Auto-creation of the associated subnet"
}
variable "vpc_desc" { }
variable "routing_mode" { }