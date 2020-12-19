resource "intersight_deviceconnector_policy" "dcp1" {
  name            = "device_con1"
  description     = "Device Connector Policy - Local Access Disabled"
  lockout_enabled = false
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.default.moid
  }
}

/*
SAMPLE PAYLOAD
-----------------
DeviceconnectorPolicyApi: {
  "Name": "AUTO_POLICY_CLO_CRR",
  "Description": "CLO Testing",
  "Tags": [{"Key": "clo", "Value": "True"}],
  "LockoutEnabled": True,
}
*/