// commenting out will not remove the tag. But we can set different tags and only these will be set.
resource "meraki_devices" "vmx_network_device_tag" {
  depends_on = [ meraki_networks_devices_claim_vmx.claim ]
  serial = meraki_networks_devices_claim_vmx.claim.item.serial
  tags = [ "Deployed" ]
}

output "meraki_devices_vmx_network_device_tag" {
  value = meraki_devices.vmx_network_device_tag
}
