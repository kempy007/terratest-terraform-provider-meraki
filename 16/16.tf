data "meraki_networks" "my_networks" {
  provider        = meraki
  organization_id = var.organization_id
}

output "data_meraki_networks" {
  value = data.meraki_networks.my_networks
}
