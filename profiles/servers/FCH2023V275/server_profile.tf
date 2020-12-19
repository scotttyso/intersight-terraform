data "intersight_compute_rack_unit" "FCH2023V275" {
    serial = "FCH2023V275"
}

# Create the Server Profile
resource "intersight_server_profile" "lnx-svc1" {
    depends_on = [data.intersight_compute_rack_unit.FCH2023V275]
    organization {
        object_type = "organization.Organization"
        moid = data.intersight_organization_organization.default.moid
    }

    description = "Terraform deployed"
    name = "lnx-svc1"

    # After configuring serial number in devices.tf, uncomment this
    # assigned_server block accordingly.

    assigned_server {
        object_type = "compute.RackUnit"
        moid = data.intersight_compute_rack_unit.FCH2023V275.moid
    }

    # action = "null"
}