data "meraki_devices" "vmx_network_device" {
  depends_on = [ meraki_networks_devices_claim_vmx.claim ]
  organization_id = var.organization_id
  network_ids     = [meraki_networks.vmx_network.id]
}

output "data_meraki_devices" {
    value = data.meraki_devices.vmx_network_device
}
