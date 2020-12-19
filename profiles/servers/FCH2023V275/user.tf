resource "intersight_iam_end_point_user_policy" "linux_admin" {
  depends_on  = [intersight_server_profile.lnx-svc1]
  name        = "linux_admin"
  description = "TerraForm Test User Policy"

  password_properties {
    enforce_strong_password  = true
    enable_password_expiry   = false
    password_expiry_duration = 50
    password_history         = 5
    notification_period      = 1
    grace_period             = 2
  }
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.default.moid
  }
  profiles {
          object_type = "server.Profile"
          moid = intersight_server_profile.lnx-svc1.moid
  }
}