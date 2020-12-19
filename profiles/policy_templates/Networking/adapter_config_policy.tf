resource "intersight_adapter_config_policy" "{{adpt_cfg_name}}" {
  depends_on  = [intersight_server_profile.{{server_profile}}]
  name        = "{{adpt_cfg_name}}"
  description = "{{descr}}"
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.default.id
  }
  settings {
    object_type="adapter.AdapterConfig"
    slot_id = "1"
    eth_settings {
      lldp_enabled = {{lldp_enabled}}
      object_type="adapter.EthSettings"
    }
    fc_settings {
      object_type="adapter.FcSettings"
      fip_enabled = {{fip_enabled}}
    }
  }
  profiles {
    object_type = "server.Profile"
    moid        = intersight_server_profile.{{server_profile}}.moid
  }
}

