resource "intersight_vnic_eth_network_policy" "v_eth_network1" {
  name = "v_eth_network1"
  organization {
    object_type = "organization.Organization"
    moid = var.organization
  }
  vlan_settings {
    object_type = "vnic.VlanSettings"
    default_vlan = 1
    mode = "ACCESS"
  }
}

resource "intersight_vnic_eth_qos_policy" "v_eth_qos1" {
  name = "v_eth_qos1"
  mtu = 1500
  rate_limit = 0
  cos = 0
  trust_host_cos = false
  organization {
    object_type = "organization.Organization"
    moid = var.organization
  }
}

