resource "meraki_devices" "vmx_network_device_name" {
  depends_on = [ meraki_networks_devices_claim_vmx.claim ]
  serial = meraki_networks_devices_claim_vmx.claim.item.serial
  name = var.device_name
}

output "meraki_devices_vmx_network_device_name" {
  value = resource.meraki_devices.vmx_network_device_name
}
