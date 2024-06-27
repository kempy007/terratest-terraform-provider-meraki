// Set outbound rule.
// works in "0.2.3-alpha"
resource "meraki_networks_appliance_firewall_l3_firewall_rules" "example" {
  network_id = meraki_networks.vmx_network.id 
  rules = [ {
    comment = "Allow all inbound traffic"
    # name = "Allow all inbound traffic" 
    policy = "allow"
    protocol = "any"
    src_cidr = "0.0.0.0/0"
    src_port = "any" 
    dest_cidr = "0.0.0.0/0"
    dest_port = "any"
    # syslog_enabled  = "true" // breaks
  } ]
}

output "meraki_networks_appliance_firewall_l3_firewall_rules" {
    value = meraki_networks_appliance_firewall_l3_firewall_rules.example
}
