# For autovpn:
# Security & SD-WAN -> Site-to-site VPN
# type: Hub
# local networks: 
# VPN Mode: Enabled
# Rest of the settings for auto-vpn are picked up at org level
resource "meraki_networks_appliance_vpn_site_to_site_vpn" "example" {
  network_id = meraki_networks.vmx_network.id
  # hubs = [ { } ]
  mode = "hub"
  subnets = [ {
      local_subnet =  meraki_networks_appliance_single_lan.vmx_singlelan.subnet
      use_vpn = true
  } ]
}

output "meraki_networks_appliance_vpn_site_to_site_vpn" {
  value = meraki_networks_appliance_vpn_site_to_site_vpn.example
}
