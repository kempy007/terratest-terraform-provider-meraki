// Site-to-site outbound firewall rules.??
// https://github.com/cisco-open/terraform-provider-meraki/blob/main/examples/resources/meraki_organizations_appliance_vpn_vpn_firewall_rules/resource.tf
// todo failed in 0.2.4-alpha
resource "meraki_organizations_appliance_vpn_vpn_firewall_rules" "example" {
  organization_id = var.organization_id
  rules = [{
    comment        = "TEST RULE"
    dest_cidr      = "1.1.1.1/32"
    dest_port      = "53"
    policy         = "allow"
    protocol       = "tcp"
    src_cidr       = "Any"
    src_port       = "Any"
    syslog_enabled = false
  }]
  syslog_default_rule = false
}
# ╷
# │ Error: Provider produced inconsistent result after apply
# │ 
# │ When applying changes to meraki_organizations_appliance_vpn_vpn_firewall_rules.example, provider "provider[\"registry.terraform.io/cisco-open/meraki\"]" produced an unexpected new
# │ value: .rules: actual set element cty.ObjectVal(map[string]cty.Value{"comment":cty.StringVal("Default rule"), "dest_cidr":cty.StringVal("Any"), "dest_port":cty.StringVal("Any"),
# │ "policy":cty.StringVal("allow"), "protocol":cty.StringVal("Any"), "src_cidr":cty.StringVal("Any"), "src_port":cty.StringVal("Any"), "syslog_enabled":cty.False}) does not correlate
# │ with any element in plan.
# │ 
# │ This is a bug in the provider, which should be reported in the provider's own issue tracker.
# ╵
# ╷
# │ Error: Provider produced inconsistent result after apply
# │ 
# │ When applying changes to meraki_organizations_appliance_vpn_vpn_firewall_rules.example, provider "provider[\"registry.terraform.io/cisco-open/meraki\"]" produced an unexpected new
# │ value: .rules: length changed from 1 to 2.
# │ 
# │ This is a bug in the provider, which should be reported in the provider's own issue tracker.

output "meraki_organizations_appliance_vpn_vpn_firewall_rules" {
  value = meraki_organizations_appliance_vpn_vpn_firewall_rules.example
}
