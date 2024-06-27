data "meraki_networks_firmware_upgrades" "firmware" {
    depends_on = [ meraki_networks_devices_claim_vmx.claim ]
    network_id = meraki_networks.vmx_network.id
}

locals {
  stable_or_candidate_versions = [
    for v in data.meraki_networks_firmware_upgrades.firmware.item.products.appliance.available_versions : v
    if v.release_type == "stable" || v.release_type == "candidate"
  ]

  latest_firmware = reverse(local.stable_or_candidate_versions[*].id)[0]
}

output "data_meraki_networks_firmware_upgrades" {
    value = data.meraki_networks_firmware_upgrades.firmware
}

output "local_latest_firmware" {
    value = local.latest_firmware
}

output "local_stable_or_candidate_versions" {
    value = local.stable_or_candidate_versions
}
