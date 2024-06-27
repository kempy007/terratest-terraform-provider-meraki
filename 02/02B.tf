# Failed to work in "0.2.0-alpha"
// working in "0.2.2-alpha"
resource "meraki_networks_devices_claim_vmx" "claim" {
  network_id = meraki_networks.vmx_network.id
  parameters = {
    size = "large"
  }
}

output "meraki_networks_devices_claim_vmx" {
    value = meraki_networks_devices_claim_vmx.claim
}
