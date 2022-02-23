variable "storage_account_name" {
  type        = string
  default     = ""
  description = "(Required) New Storage Account Name"
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "(Required) Storage Account Resoruce Group"
}

variable "settings" {
  default     = {}
  description = "(Required) Used to handle passthrough parameters"
}

variable "storage_account" {
  default = {}
  description = "Storage Account Settings"
}

variable "base_tags" {
  type        = map(any)
  default     = {}
  description = "Base tags for the resource"
}