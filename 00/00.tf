terraform {
  required_providers {
    meraki = {
      source  = "cisco-open/meraki"
      version = "0.2.4-alpha"
    }
  }
}

provider "meraki" {
    meraki_debug = var.meraki_debug
}

variable "meraki_debug" {
  default = "false"
}

variable "organization_id" {
    default = ""
}

variable "network_name" {
    default = ""
}

variable "device_name" {
  default = ""  
}