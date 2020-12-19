resource "intersight_iam_ldap_policy" "{{ldap_name}}" {
  name                   = "{{ldap_name}}"
  description            = "{{ldap_name}}"
  enabled                = {{ldap_name}}
  enable_dns             = {{ldap_name}}
  user_search_precedence = "{{ldap_name}}"
  organization {
    object_type = "organization.Organization"
    moid = data.intersight_organization_organization.default.moid
  }
  base_properties {
    attribute                  = "CiscoAvPair"
    base_dn                    = "{{base_dn}}"
    bind_dn                    = "{{bind_dn}}"
    bind_method                = "{{bind_method}}"
    domain                     = "{{domain}}"
    enable_encryption          = {{encryption}}
    enable_group_authorization = {{group_auth}}
    filter                     = "sAMAccountName"
    group_attribute            = "memberOf"
    nested_group_search_depth  = {{search_depth}}
    timeout                    = {{timeout}}
  }
  dns_parameters {
    nr_source        = "{{nr_source}}"
    search_forest = "{{search_forrest}}"
    search_domain = "{{search_domain}}"
  }
}

/*
SAMPLE PAYLOAD
-----------------
IamLdapPolicyApi: {
    "Name": "AUTO_LDAP_POLICY_CRR",
    "Description": "Test policy",
    "Tags": [{"Key": "ldap", "Value": "Ldap_policy"}],
    "Enabled": True,
    "EnableDns": False,
    "BaseProperties": {
        "BaseDn": "DC=new,DC=com",
        "Domain": "new.com",
        "EnableEncryption": True,
        "BindDn": "admin",
        "Timeout": 180,
        "BindMethod": "Anonymous",
        "Filter": "sAMAccountName",
        "Attribute": "CiscoAvPair",
        "GroupAttribute": "memberOf",
        "NestedGroupSearchDepth": 128,
        "EnableGroupAuthorization": True
    },
    "DnsParameters": {
        "Source": "Extracted",
        "SearchForest": "",
        "SearchDomain": ""
    },
    "UserSearchPrecedence": "LocalUserDb"
}
*/
