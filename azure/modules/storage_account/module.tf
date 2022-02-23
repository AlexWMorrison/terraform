data "azurerm_resource_group" "stgRG" {
    name = var.resource_group_name
}

resource "azurerm_storage_account" "storageAccount" {
  name                      = azurecaf_name.storageAccount.result
  resource_group_name       = data.azurerm_resource_group.stgRG.name
  location                  = data.azurerm_resource_group.stgRG.location
  account_tier              = try(var.storage_account.account_tier, "Standard")
  account_replication_type  = try(var.storage_account.account_replication_type, "LRS")
  account_kind              = try(var.storage_account.account_kind, "StorageV2")
  access_tier               = try(var.storage_account.access_tier, "Hot")
  enable_https_traffic_only = try(var.storage_account.nfsv3_enabled, false) ? false : true
  #if using nfsv3_enabled, then https must be disabled
  min_tls_version          = try(var.storage_account.min_tls_version, "TLS1_2")
  allow_blob_public_access = try(var.storage_account.allow_blob_public_access, true)
  is_hns_enabled           = try(var.storage_account.is_hns_enabled, false)
  nfsv3_enabled            = try(var.storage_account.nfsv3_enabled, false)
  large_file_share_enabled = try(var.storage_account.large_file_share_enabled, null)
  tags                     = merge(var.base_tags, local.tags)


  dynamic "identity" {
    for_each = lookup(var.storage_account, "enable_system_msi", false) == false ? [] : [1]

    content {
      type = "SystemAssigned"
    }
  }

  dynamic "static_website" {
    for_each = lookup(var.storage_account, "static_website", false) == false ? [] : [1]

    content {
      index_document     = try(var.storage_account.static_website.index_document, null)
      error_404_document = try(var.storage_account.static_website.error_404_document, null)
    }
  }

  lifecycle {
    ignore_changes = [
      location, resource_group_name
    ]
  }
}

module "container" {
  source   = "./container"
  for_each = try(var.storage_account.containers, {})

  storage_account_name = azurerm_storage_account.storageAccount.name
  settings             = each.value
}