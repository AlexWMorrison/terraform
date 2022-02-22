variable "cdn_profile_name" {
  type        = string
  default     = ""
  description = "Existing CDN Profile Name"
}

variable "cdn_profile_rg_name" {
  type        = string
  default     = ""
  description = "Existing CDN Profile Resoruce Group"
}

variable "settings" {
  default     = {}
  description = "(Required) Used to handle passthrough parameters"
}

variable "base_tags" {
  type        = map(any)
  default     = {}
  description = "Base tags for the resource"
}

variable "app_static_blob_name" {
  type        = string
  default     = ""
  description = "Existing Storage Account that hosts the Static Website"
}

variable "app_static_blob_rg_name" {
  type        = string
  default     = ""
  description = "Existing Storage Account Resource Group "
}