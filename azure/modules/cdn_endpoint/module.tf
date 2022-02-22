resource "azurerm_cdn_endpoint" {
    name = var.settings.name
    profile_name = data.azurerm_cdn_profile.cdnProfile.name
    location = data.azurerm_cdn_profile.cdnProfile.location
    resource_group_name = data.azurerm_cdn_profile.cdnProfile.resource_group_name

    origin {
        name = var.settings.origin.name
        host_name = data.azurerm_storage_account.staticWebsite.host_name
        #create storage account for this excersize 
    }
}