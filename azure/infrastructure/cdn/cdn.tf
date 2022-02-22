module "cdn_profile" {
    source = "./modules/cdn_profile"
    #for_each = local.cdn_profile
}

module "cdn_endpoint" {
    source = "./modules/cdn_endpoint"
    name = var.cdn_endpoint_name
}

# resource "azurerm_cdn_endpoint" {
#     name = "testEndpoint"
#     profile_name = data.azurerm_cdn_profile.cdnProfile.name
#     location = data.azurerm_cdn_profile.cdnProfile.location
#     resource_group_name = data.azurerm_cdn_profile.cdnProfile.resource_group_name

#     origin {
#         name = "testapp-dev"
#         host_name = data.azurerm_storage_account.staticWebsite.host_name
#     }
# }