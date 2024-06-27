// set syslog 
// todo failed 0.2.4-alpha
resource "meraki_networks_syslog_servers" "example" {
  network_id = meraki_networks.vmx_network.id
  servers = [{
    host  = "1.2.3.4"
    port  = 7514
    # roles = ["Wireless event log", "URLs"]
    # roles = ["Security events", "Appliance event log"]
    roles = ["Appliance event log"]
  }]
}
# ╷
# │ Error: Resource NetworksSyslogServers only have update context, not create.
# │ 
# │   with meraki_networks_syslog_servers.example,
# │   on main.tf line 171, in resource "meraki_networks_syslog_servers" "example":
# │  171: resource "meraki_networks_syslog_servers" "example" {
# │ 
# │ error with operation GetNetworkSyslogServers

output "meraki_networks_syslog_servers" {
    value = meraki_networks_syslog_servers.example
}
