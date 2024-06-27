// Works in 0.2.4-alpha
// settingsChanged ampMalwareDetected ampMalwareBlocked rogueDhcp rogueAP
resource "meraki_networks_alerts_settings" "example" {
  network_id = meraki_networks.vmx_network.id
  alerts = [ {
    alert_destinations = {
      all_admins = false 
      http_server_ids = [ meraki_networks_webhooks_http_servers.example.id ]
      snmp = false       
    }
    enabled = true
    filters = { timeout = 60 }
    type = "settingsChanged"
  }, {
    alert_destinations = {
      all_admins = false 
      http_server_ids = [ meraki_networks_webhooks_http_servers.example.id ]
      snmp = false       
    }
    enabled = true
    filters = { timeout = 60 }
    type = "ampMalwareDetected"
  }, 
  ]
}

output "meraki_networks_alerts_settings" {
    value = meraki_networks_alerts_settings.example
}
