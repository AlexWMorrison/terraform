#do you need these variables declared here that are also declared in the module variables.tf? 
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

#change this to accept multiple values in the future - also naming can be handled by a naming tf pattern of some sort
variable "cdn_endpoint_name" {
  type        = string
  default     = ""
  description = "Existing CDN Endpoint Name"
}