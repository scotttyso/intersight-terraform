resource "intersight_iam_end_point_user_policy" "{{username}}" {
  depends_on  = [intersight_server_profile.{{server_profile}}]
  name        = "{{username}}"
  description = "{{descr}}"

  password_properties {
    enforce_strong_password  = {{enforcement}}
    enable_password_expiry   = {{expiry}}
    password_expiry_duration = {{expire_dur}}
    password_history         = {{pass_hist}}
    notification_period      = {{notify_period}}
    grace_period             = {{grace_period}}
  }
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.default.moid
  }
  profiles {
          object_type = "server.Profile"
          moid = intersight_server_profile.{{server_profile}}.moid
  }
}