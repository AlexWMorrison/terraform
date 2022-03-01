data "azurerm_resource_group" "cdnRG" {
    name = var.cdn_profile_rg_name
}

resource "azurerm_cdn_profile" "cdnProfile" {
    name = var.cdn_profile_name
    resource_group_name = data.azurerm_resource_group.cdnRG.name
    location = data.azurerm_resource_group.cdnRG.location
    sku = var.settings.sku
    #tags = local.tags
}