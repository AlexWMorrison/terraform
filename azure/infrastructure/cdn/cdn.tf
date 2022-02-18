data "azurerm_resource_group" "cdnRG" {
    name = "${var.cdn_profile_rg_name}"
}

data "azurerm_resource_group" "storageAccountRG" {
    name = "${var.app_static_blob_rg_name}"
}

data "azurerm_cdn_profile" "cdnProfile" {
    name = "${var.cdn_profile_name}"
    resource_group_name = data.azurerm_resource_group.cdnRG.name
}

data "azurerm_storage_account" "staticWebsite" {
    name = "${var.app_static_blob_name}"
    resource_group_name = data.azurerm_resource_group.storageAccountRG.name
}

resource "azurerm_cdn_endpoint" {
    name = "testEndpoint"
    profile_name = data.azurerm_cdn_profile.cdnProfile.name
    location = data.azurerm_cdn_profile.cdnProfile.location
    resource_group_name = data.azurerm_cdn_profile.cdnProfile.resource_group_name

    origin {
        name = "testapp-dev"
        host_name = data.azurerm_storage_account.staticWebsite.host_name
    }
}