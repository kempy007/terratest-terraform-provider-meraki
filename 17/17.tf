// TODO failed 0.2.4-alpha
resource "meraki_networks_firmware_upgrades" "update_firmware" {
    depends_on = [ meraki_networks_devices_claim_vmx.claim ]
    network_id = meraki_networks.vmx_network.id
    products = {
      appliance = {
        next_upgrade = {
          time = "2024-03-05T17:48:00Z",
          to_version = {
            id = local.latest_firmware
          }
        }
      }
    }
}
# │ Error: Failure when executing UpdateNetworkFirmwareUpgrades
# │ 
# │   with meraki_networks_firmware_upgrades.update_firmware,
# │   on main.tf line 71, in resource "meraki_networks_firmware_upgrades" "update_firmware":
# │   71: resource "meraki_networks_firmware_upgrades" "update_firmware" {
# │ 
# │ error with operation UpdateNetworkFirmwareUpgrades

output "meraki_networks_firmware_upgrades" {
  value = meraki_networks_firmware_upgrades.update_firmware
}
