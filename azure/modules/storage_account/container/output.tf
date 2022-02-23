output "name" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.storageContainer.name
}

output "resource_manager_id" {
  description = "The Resource Manager ID of this Storage Container."
  value       = azurerm_storage_container.storageContainer.resource_manager_id
}

output "id" {
  description = "The Resource Manager ID of this Storage Container. Used by role_mapping"
  value       = azurerm_storage_container.storageContainer.resource_manager_id
}

output "url" {
  description = "The Resource Manager ID (URL) of this Storage Container."
  value       = azurerm_storage_container.storageContainer.id
}