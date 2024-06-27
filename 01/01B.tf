resource "meraki_networks" "vmx_network" {
  name            = var.network_name
  notes           = "Terraform deployed network"
  organization_id = var.organization_id
  product_types   = ["appliance"] # IF more than just appliance then you cannot claim a vmx.
  tags            = ["terraform"]
  time_zone       = "Europe/London"
}

output "meraki_networks" {
    value = meraki_networks.vmx_network
}
