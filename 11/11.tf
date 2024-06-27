# # Failed to work in "0.2.0-alpha" > failed in "0.2.2-alpha"
// works in "0.2.3-alpha"
resource "meraki_devices_appliance_vmx_authentication_token" "this" {
  serial = meraki_networks_devices_claim_vmx.claim.item.serial
}

output "meraki_devices_appliance_vmx_authentication_token" {
    value = meraki_devices_appliance_vmx_authentication_token.this
}
