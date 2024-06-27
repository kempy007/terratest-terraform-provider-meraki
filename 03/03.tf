
#firewall security policy
// TODO failed "0.2.3-alpha" 0.2.4-alpha
resource "meraki_networks_appliance_firewall_inbound_firewall_rules" "example" {
  network_id = meraki_networks.vmx_network.id
  rules = [ {
    # name = "Allow all inbound traffic"
    comment = "Allow all inbound traffic"
    policy = "allow"
    protocol = "any"
    src_cidr = "0.0.0.0/0"
    src_port = "any" 
    dest_cidr = "0.0.0.0/0"
    dest_port = "any"
    # syslog_enabled = "true" 
  } ]
}
# │ Error: Failure when executing UpdateNetworkApplianceFirewallInboundFirewallRules
# │ 
# │   with meraki_networks_appliance_firewall_inbound_firewall_rules.name,
# │   on main.tf line 127, in resource "meraki_networks_appliance_firewall_inbound_firewall_rules" "name":
# │  127: resource "meraki_networks_appliance_firewall_inbound_firewall_rules" "name" {
# │ 
# │ error with operation UpdateNetworkApplianceFirewallInboundFirewallRules

output "meraki_networks_appliance_firewall_inbound_firewall_rules" {
    value = meraki_networks_appliance_firewall_inbound_firewall_rules.example
}
