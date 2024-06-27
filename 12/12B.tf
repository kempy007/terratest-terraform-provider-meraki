resource "meraki_networks_appliance_single_lan" "vmx_singlelan" {
    depends_on = [ meraki_networks_devices_claim_vmx.claim ]
    network_id = meraki_networks.vmx_network.id
    subnet = "10.0.4.0/24"
    appliance_ip = "10.0.4.254"
}

output "meraki_networks_appliance_single_lan" {
  value = meraki_networks_appliance_single_lan.vmx_singlelan
}
