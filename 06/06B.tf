// set webhooks
// Works in 0.2.4-alpha
resource "meraki_networks_webhooks_http_servers" "example" {
  name = "Test Webhook"
  url = "https://example.com/test"
  network_id = meraki_networks.vmx_network.id
  shared_secret = "redactedSecret"
  payload_template = {
    name = "Meraki (included)"
    payload_template_id = "wpt_00001"  
  }
}

output "meraki_networks_webhooks_http_servers" {
    value = meraki_networks_webhooks_http_servers.example
}
