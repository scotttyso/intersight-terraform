terraform {
    required_version = "~> 0.13"
    required_providers {
        intersight = {
            source = "CiscoDevNet/intersight"
            version = "0.1.1"
        }
    }
}

provider "intersight" {
    apikey = var.api_key
    secretkeyfile = var.secretkeyfile
    endpoint = var.endpoint
}

## Get the MO data for the default organization in the account.
# /api/v1/organization/Organizations$filter=(Name eq 'default')
data "intersight_organization_organization" "default" {
    name = "default"
}

output "org_default_moid" {
    value = data.intersight_organization_organization.default.moid
}